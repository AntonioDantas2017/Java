class Alterar extends funcoes{
	public dados[] alterar(dados objdados[])	
	{
		System.out.println("Digite o nome do candidato:");
		String nome = verifica(KeyBoard.KeyString());
		int qtd = objdados.length;
		
		double nota = -1;
		for(int i=0;i<qtd;i++)
		{
			if(objdados[i].getNome().equals(nome))
			{
				System.out.println("Digite a nota do candidato "+nome+":");
				nota = verifica(KeyBoard.KeyDouble());
				objdados[i].setNota(nota);
				break;
			}			
		}	
		if(nota < 0)
			System.out.println("O candidato nao foi encontrado");	
		return objdados;
	}
}