class Consultar extends funcoes{
	public boolean consultar(dados objdados[], boolean excluir)	
	{
		System.out.print("Digite o nome do(a) candidato(a):");
		String nome = verifica(KeyBoard.KeyString());
		int qtd = objdados.length;
		
		boolean aux = false;
		
		for(int i=0;i<qtd;i++)
		{
			if(objdados[i].getNome().equals(nome))
			{
				if(excluir)
				{
					System.out.println("Candidato(a) excluido");
					objdados[i] = new dados(objdados[qtd-1].getNome(),objdados[qtd-1].getNota());
					objdados = redimensionar(objdados,qtd-1);
				}else{
					System.out.println("A nota do(a) candidato(a) "+nome+" e: "+objdados[i].getNota());
				}
				aux = true;
				break;
			}			
		}	
		if(aux == false)
			System.out.println("Candidato(a) nao foi encontrado");
			
		return aux;
	}
}