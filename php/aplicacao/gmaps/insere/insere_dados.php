<?PHP
	require_once("../../../config/config.php");
	require_once("../../../comum/funcoes.php");
	$conexao=conectar($dados_conexao);
	$rgi = $_GET['rgi'];
	$data = $_GET['data'];
	$nome_proprietario = $_GET['nome_proprietario'];
	$geometria = $_GET['geometria'];
	//$fgdfsd = date("Y-m-d H:i:s");
	//echo $geometria;
	$geometria = "POINT(".$geometria.")";
	$consulta = "
					INSERT INTO proprietario(nome)
					VALUES(?)
				";
	$stmt = mysqli_prepare($conexao, $consulta);
	if (!$stmt){
		sair(mysqli_error($conexao), $conexao);
	}
	mysqli_stmt_bind_param($stmt, "s", $nome_proprietario);
	$sucesso = mysqli_stmt_execute($stmt);
	if (!$sucesso){
		sair(mysqli_stmt_error($stmt), $conexao, $stmt);
	}
	mysqli_stmt_close($stmt);
	$id_proprietario = mysqli_insert_id($conexao);
	$consulta = "
					INSERT INTO imovel(local, rgi, data, id_proprietario)
					VALUES(ST_GeomFromText(?, 4326), ?, ?, ?)
				";
	$stmt = mysqli_prepare($conexao, $consulta);
	if (!$stmt) {
		sair(mysqli_error($conexao), $conexao);
	}
	mysqli_stmt_bind_param($stmt, "sssi", $geometria, $rgi, $data, $id_proprietario);
	$sucesso = mysqli_stmt_execute($stmt);
	if (!$sucesso){
		sair(mysqli_stmt_error($stmt), $conexao, $stmt);
	}
	mysqli_stmt_close($stmt);
	mysqli_close($conexao);
	exit;
?>