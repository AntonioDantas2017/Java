class Relatar extends funcoes{
	public void relatar(dados objdados[],int qtd)
	{
		if(numero(qtd))
		{
			for (int i = 0; i < qtd; i++) {
				for (int j = 0; j < qtd; j++) {
					if (objdados[i].getNota() > objdados[j].getNota()) {
						double temp = objdados[i].getNota();
						objdados[i].setNota(objdados[j].getNota());
						objdados[j].setNota(temp);
						
						String temp2 = objdados[i].getNome();
						objdados[i].setNome(objdados[j].getNome());
						objdados[j].setNome(temp2);
					}
				}
			}	
			
			System.out.println("Candidato | Nota ");
			for(int i=0;i<qtd;i++)
			{
				System.out.println(objdados[i].getNome()+" | "+objdados[i].getNota());
			}	
		}
	}
}