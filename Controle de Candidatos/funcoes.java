// Funções
class funcoes {

	public static  String verifica(String nome)
	{
		while(nome.equals(""))
			nome = KeyBoard.KeyString();
		return nome;
	}
	
	public static  double verifica(double nota)
	{
		
		while((nota < 0) || (nota > 100))
			nota = KeyBoard.KeyDouble();
		return nota;				
	}
	
	public static boolean numero(int quantidade)
	{
		if(quantidade>0)
			return true;
		else{
			System.out.println("Nao Existe candidatos");
			return false;
		}
	}
	
	public static  int verifica(int qtd)
	{
		while(qtd<=0)
			qtd = KeyBoard.KeyInt();
		return qtd;
	}
	
	public static dados[] redimensionar(dados objdados[],int qtd)
	{
		dados tmp[] = new dados[qtd];  
		System.arraycopy (objdados, 0, tmp, 0, Math.min (objdados.length, tmp.length)); // isto copia o array antigo sobre o novo  		
		return tmp;
	}
}