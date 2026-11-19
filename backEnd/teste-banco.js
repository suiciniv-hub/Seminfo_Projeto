const banco = require('./db');
async function testarConexao() {
  try {
    const [resultado] = await banco.query(
        'SELECT DATABASE () AS banco, CURRENT_USER () AS usuario'
    );
    console.log('conexão realizada com sucesso');
    console.log(resultado);
  } catch (erro) {
    console.error('Código:', erro.code);
    console.error('Mensagem:', erro.message);
  }finally {
    await banco.end();
  }
}
testarConexao();