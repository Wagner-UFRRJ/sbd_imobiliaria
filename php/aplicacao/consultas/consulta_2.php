<?php
	require_once("../../config/config.php");
	require_once("../../comum/funcoes.php");
	$conexao=conectar($dados_conexao);
	$consulta = "
				SELECT a.id as id_a, b.id as id_b, ST_AsText(a.local) as geometria_a, ST_AsText(b.local) as geometria_b, ST_DISTANCE(a.local, b.local) as distancia
				FROM imovel a, imovel b
				WHERE a.id < b.id
			";
	$resultado_consulta = mysqli_query($conexao, $consulta);
	if (!$resultado_consulta){
		sair("Consulta inválida: ".mysqli_error($conexao), $conexao);
	}
	echo "<table class='tabela_resultado'>";
	echo "<tr><th>Imóvel A</th><th>Imóvel B</th><th>Geometria Imóvel A</th><th>Geometria Imóvel B</th><th>Distância AB</th></tr>";
	while ($linha = mysqli_fetch_assoc($resultado_consulta)){
		echo "<tr>";
		echo "<td>".$linha["id_a"]."</td><td>". $linha["id_b"]."</td><td>". $linha["geometria_a"]."</td><td>". $linha["geometria_b"]."</td><td>".$linha["distancia"]."</td>";
		echo "</tr>";
	}
	echo "</table>";
?>