class Incluir extends funcoes{
	
	public dados[] incluir(dados objdados[],int qtd,int aux_qtd)
	{	
		
		for(int i=aux_qtd;i<qtd;i++)
		{
			System.out.print("Digite o nome do(a) candidato(a):");
			String nome = verifica(KeyBoard.KeyString());
			System.out.print("Digite a nota do(a) candidato(a) "+nome+":");			
			double nota = verifica(KeyBoard.KeyDouble());
			objdados[i] = new dados(nome,nota);
		}	
		
		return objdados;
	}
}