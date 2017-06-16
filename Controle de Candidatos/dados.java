class dados {
      private String nome;
      private double nota;
      private int qtd;	  

      dados(String nome,double nota)
	  {
		setNome(nome);
		setNota(nota);
      }
 
      public void setQtd(int qtd){
		this.qtd = qtd;	
      }
	  
	  public void setNome(String nome){
		this.nome = nome;	
      }

      public void setNota(double nota){
		this.nota =  nota;	
      }

      public String getNome() {
		return this.nome;
	  }

      public double  getNota() {
		return this.nota;
	  }   
	  
	  public double  getQtd() {
		return this.qtd;
	  }      
}
