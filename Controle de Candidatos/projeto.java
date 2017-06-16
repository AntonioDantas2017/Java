// Java Document
class projeto extends funcoes{
		
		public static int qtd = 0;
		
        public static void main(String args[]){ 
			
			Incluir objinc = new Incluir();
			
			System.out.println("Digite a quantidade de candidatos a adicionar:");
			qtd = verifica(KeyBoard.KeyInt());
			dados objdados[] = new dados[qtd];
				
			objdados = objinc.incluir(objdados,qtd,0);
			boolean cont = true;
			while(cont)
			{
				System.out.println("\n Escolha a operacao desejada, ou digite -1 para finalizar:");
				System.out.println("( 1 ) Incluir; ( 2 ) Consultar; ( 3 ) Alterar; ( 4 ) Excluir; ( 5 ) Relatar;");			
				int op = KeyBoard.KeyInt();

				Consultar objcon = new Consultar();				

				switch(op)
				{
					
					case 1:
						int aux_qtd = qtd;
						System.out.println("Digite quantos candidatos voce deseja adicionar:");
						qtd += verifica(KeyBoard.KeyInt());
						objdados = redimensionar(objdados,qtd);
						objdados = objinc.incluir(objdados,qtd,aux_qtd);
						break;
					case 2:
						boolean aux = objcon.consultar(objdados,false);
						break;
					case 3:
						Alterar objalt = new Alterar();
						objdados = objalt.alterar(objdados);
						break;
					case 4:
						if(objcon.consultar(objdados,true))
							qtd--;
						break;						
					case 5:
						Relatar objrel = new Relatar();
						objrel.relatar(objdados,qtd);
						break;
					case -1:
						cont = false;
						break;
					default:
						System.out.println("Escolha uma operacao valida");
				}	
			}			
		}
}