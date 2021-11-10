<?php
	require_once("../../config/config.php");
	require_once("../../comum/funcoes.php");
	$conexao=conectar($dados_conexao);
	$consulta = "
				SELECT id, ST_AsGeoJSON(geometria) as geometria_geojson, ST_Area(geometria) as area_mysql
				FROM regiao
				WHERE id=2
			";
	$resultado_consulta = mysqli_query($conexao, $consulta);
	if (!$resultado_consulta){
		sair("Consulta inválida: ".mysqli_error($conexao), $conexao);
	}
	$geometria_geojson;
	while ($linha = mysqli_fetch_assoc($resultado_consulta)){
		$geometria_geojson=$linha["geometria_geojson"];
		//$linha["area_mysql"];
	}
	print_r($geometria_geojson);
	echo "<br><br>";
	$geometria_array=json_decode($geometria_geojson);
	$pontos = &$geometria_array->coordinates[0];
	print_r($pontos);
	echo "<br><br>";
	$total_pontos=count($geometria_array->coordinates[0]);
	echo $total_pontos;
	echo "<br><br>";
	include("../../../bbt/proj4php-master/vendor/autoload.php");
	use proj4php\Proj4php;
	use proj4php\Proj;
	use proj4php\Point;
	$proj4 = new Proj4php();
	$proj4->addDef("EPSG:32723",'+proj=utm +zone=23 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs');
	$projWGS84 = new Proj('EPSG:4326', $proj4);
	$projUTM = new Proj('EPSG:32723', $proj4);
	for($i=0; $i<$total_pontos; $i++){
		$pontoWGS84 = new Point($pontos[$i][0], $pontos[$i][1], $projWGS84);
		echo "Ponto em WGS84: " . $pontoWGS84->toShortString() . "<br><br>";
		$pointUTM = $proj4->transform($projUTM, $pontoWGS84);
		$pointUTM_string=$pointUTM->toShortString();
		echo "Ponto em UTM: " . $pointUTM_string . "<br><br>";
		$lat_lng_array = explode(" ", $pointUTM_string);
		$pontos[$i][0]=floatval($lat_lng_array[0]);
		$pontos[$i][1]=floatval($lat_lng_array[1]);
	}
	$geometria_utm = json_encode($geometria_array);
	echo $geometria_utm;
	$consulta = "
				UPDATE regiao
				SET geometria_utm=ST_GeomFromGeoJSON('$geometria_utm', 1, 32723)
				WHERE id=2
			";
	$resultado_consulta = mysqli_query($conexao, $consulta);
	if (!$resultado_consulta){
		sair("Consulta inválida: ".mysqli_error($conexao), $conexao);
	}
?>