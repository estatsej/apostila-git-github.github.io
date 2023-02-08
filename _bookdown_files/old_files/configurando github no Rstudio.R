#Fonte: https://beatrizmilz.github.io/slidesR/git_rstudio/09-2021-gyn.html#1


#1) Faça o download e instale o git em https://git-scm.com/downloads 
#(Mantenha as configurações Default)

#2) Crie uma conta no github

#3) Informar para o Git seu nome, e email
usethis::use_git_config(
  # Seu nome de usuario no github:
  user.name = "gabrielDjusto", 
  # Seu email cadastrado no github:
  user.email = "")

#NENHUMA MESSAGEM SURGIRÁ APÓS O USO DO COMANDO ACIMA

#4) Criar um Personal Access Token (PAT)

#O pat serve  para autenticar ao GitHub, podendo ser utilizado como senha de 
#acesso ou internamente para automatizar tarefas (como criar um repositório).

usethis::create_github_token()


#5) Use a função usethis::edit_r_environ() para abrir o arquivo .Renviron para
#salvar seu token

usethis::edit_r_environ()

#Crie uma nova linha no arquivo .Renviron:

GITHUB_PAT="seu token"

#Pule uma linha e salve o arquivo. Se certifique que o arquivo termine com 
#uma linha vazia! 


#6) Vá em Session > Restart R (reinicie a sessão do R)


#7) Checando se a configuração deram certo

usethis::git_sitrep()

#As informações abaixo preccisam aparecer:
# Git config (global)
# * Name: 'Seu nome de usuario no github'
# * Email: 'Seu email cadastrado no github'
# * Global (user-level) gitignore file: <unset>
#   
#   
# * Personal access token for 'https://github.com': '<discovered>'


#OBS: "<discovered>" é importante que apareça! Caso contrário, houve algum erro em
#etapas anteriores


#gitcreds::gitcreds_set()


#Termos usados comumente:

#commit: mudanças realizadas no(s) arquivos(s) do projeto
#no repositório local (seu computador). Ao enviar
#mudanção atribuímos a mesma um texto (commit message) indicando o que está 
#sendo alterado de modo claro e breve

#push: ato de enviar as mudanças que estão em repositório local (os commits)
#para o repositório remoto (o github)

#pull: ato de trazer as atualizações que estão em  repositorio remoto 
#para o repositorio local (importante para trabalhos em conjunto). 

#pull request: quando é a contribuição de uma pessoa "externa" no projeto.
#O encarregado do projeto determina se aceita tal alteração ou não

#Caso a pessoa tenha acesso ao projeto, quando um pull é enviado ele é
#integrado automaticamente no código

#Quando há conflito de pushs, por exemplo, duas pessoas alteram a mesma
#linha de um código, devemos resolver o conflito antes de que isto seja integrado
#ao repositorio remoto! O github exibirá os conflitos, caso ocorram. Dica: Siga boas práticas!


#8) Iniciando o git

usethis::use_git()

#Para adicionar funcionalidades diferentes use branches

# no arquivo .gitgnore contém arquivos que não desejamos que sejam
# incluídos no repositório do github. 

#O arquivo .Renviron é utilizado principalmente para senhas do projeto
#portanto, adicione tal arquivo no .gitgnore

## Criando um repositorio no github

#1) Crie um projeto no Rstudio 

#2)
usethis::use_github(
  #Criando um repositório público:
  private = TRUE) #TRUE consiste em um repo privado


#3)Crie o arquivo README: É um texto em formato rmarkdown contendo o que será feito naquele 
#repositório. Criado com a função:

usethis::use_readme_rmd()


##Clonando um repositório do github (quando já há um projeto no git que queremos colaborar)

##Método 1 (Manualmente)

#Caso em que há um repositório no github e queremos baixá-lo em nosso PC

#1)Copie a URL do projeto de interesse no github


#2)abra o Rstuido e va em New project > Version control . Depois use coloque a URL 
#no campo "Repository URL" obtida no passo 1



#Caso o repositorio não seja público. Então, primeiro precisamos realizar
#um fork


##Método 2 (usando a linha de comando)

#A partir de um repositório existente, fazer um fork e clonar diretamente do RStudio

usethis::create_from_github("usuario_github/nome_do_repositorio",
                            destdir = "diretorio em seu PC onde salvar o projeto", 
                            fork = TRUE)#se igual a TRUE, irá fazer o fork do repositório. 
                                        #ou seja, aparecerá uma copia deste repo no seu github  






#Trabalhando colaborativamente

#1) Crie Branches (ramos) para realizar modificações

#2) Antes de fazer qualquer modificação nos arquivos do repo, crie uma branch com:

usethis::pr_init(branch = "")
#branch o nome da branch que você quer criar.

#3) enviando as mudanças para o repositório remoto com:

usethis::pr_push()

#Caso voce não tenha permissão para alterar o codigo automaticamente então vc
#deve aguardar que o dono do repositorio permita a alteração sugerida

#Quando sua alteracao no codigo for aceite aprecerá o rótulo "Merged"

#3) após aceita a alteração use:

usethis::pr_finish()

#Isto realiza três operações: retorna para a branch principal (master),
#realiza o pull (atualizando o conteudo do codigo todo) e deleta a brancha criada
#para enviar a modificação sugerida ao dono do repositório


