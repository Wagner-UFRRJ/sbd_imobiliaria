<?PHP
	require_once("../../../config/config.php");
	require_once("../../../comum/funcoes.php");
	function parseToXML($htmlStr){
		$xmlStr=str_replace('<','&lt;',$htmlStr);
		$xmlStr=str_replace('>','&gt;',$xmlStr);
		$xmlStr=str_replace('"','&quot;',$xmlStr);
		$xmlStr=str_replace("'",'&#39;',$xmlStr);
		$xmlStr=str_replace("&",'&amp;',$xmlStr);
		return $xmlStr;
	}
	$conexao=conectar($dados_conexao);
	$consulta = "
				SELECT i.rgi, i.data, p.nome, ST_LONGITUDE(i.local) as longitude, ST_LATITUDE(i.local) as latitude
				FROM imovel i, proprietario p
				WHERE i.id_proprietario=p.id
			";
	$resultado_consulta = mysqli_query($conexao, $consulta);
	if (!$resultado_consulta){
		sair("Consulta inválida: ".mysqli_error($conexao), $conexao);
	}

	header("Content-type: text/xml");

	$xml = new DOMDocument("1.0");
	$xml->formatOutput=true;

	$imoveis=$xml->createElement("imoveis");
	$xml->appendChild($imoveis);

	while ($linha = mysqli_fetch_assoc($resultado_consulta)){
		$imovel=$xml->createElement("imovel");
		$imoveis->appendChild($imovel);

		$rgi=$xml->createElement("rgi", $linha["rgi"]);
		$imovel->appendChild($rgi);

		$data=$xml->createElement("data", $linha["data"]);
		$imovel->appendChild($data);

		$nome=$xml->createElement("nome", $linha["nome"]);
		$imovel->appendChild($nome);

		$longitude=$xml->createElement("longitude", $linha["longitude"]);
		$imovel->appendChild($longitude);

		$latitude=$xml->createElement("latitude", $linha["latitude"]);
		$imovel->appendChild($latitude);

	}
	echo $xml->saveXML();
?>