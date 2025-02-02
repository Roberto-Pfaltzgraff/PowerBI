# BootCamp 🌿Suzano & DIO: Análise de Dados com Power BI 🎲 (*Desafio 06*)
### Desafio 06 - **Dashboard** Corporativo com Integração com **MySQL** e **Azure**  
    
## 🎯Objetivo:
Confeccionar um **Dashboard** em Power BI, conforme *Descrição do Desafio* na **Apresentação do Desafio**.  
O intuito é aplicar o conhecimento compartilhado até essa etapa do curso.  
A ferramenta a ser utilizada será: **Microsoft Power BI**.  
![alt text](./imagens/img_DesafioAceito.png)

    
## 🤓Apresentação do Desafio:
>### Descrição do Desafio
>Deverá criar um Dashboard Corporativo no Power BI, integrado com o MySQL e Azure.  
>Os 2 documentos com os detalhes para esse desafio são:  
> 1) [Desafio de Projeto - Processando e Transformando Dados com Power BI - Instruções.docx](./insumos/Desafio%20de%20Projeto%20-%20Processando%20e%20Transformando%20Dados%20com%20Power%20BI%20-%20Instruções.docx)  
> 2) [Desafio de Projeto - Processando e Transformando Dados com Power BI.pptx](./insumos/Desafio%20de%20Projeto%20-%20Processando%20e%20Transformando%20Dados%20com%20Power%20BI.pptx)  

### Objetivo:
- Criação de uma instância na Azure para MySQL
- Criar o Banco de Dados com base disponível no github
- Integração do Power BI com MySQL no Azure 
- Verificar problemas na base a fim de realizar a transformação dos dados

### Utilize os vídeos de passo a passo para criação dos elementos que compõem a primeira página do relatório:
- Objetos que definem o layout do relatório
- Gráficos (visuais) e os campos que os compõem
- Botões para navegabilidade
- Segmentadores de dados

### Dados extraídos da dica anterior
- Local original dos scripts de criação e carga dos dados desse desafio: [Desafio do Módulo 3 no GitHub da Juliana](https://github.com/julianazanelatto/power_bi_analyst/tree/main/M%C3%B3dulo%203/Desafio%20de%20Projeto)  
- Scripts de criação da estrutura dos dados (db) utilizados nesse desafio: [script_criacao_banco_dados_company.sql](./dados/script_criacao_banco_dados_company.sql) (Fiz correções)  
- Scripts de carga dos dados utilizados nesse desafio: [insercao_de_dados_e_queries.sql](./dados/insercao_de_dados_e_queries.sql) (Fiz correções)  
   

## 🤓Desafio Feito😎! Minha resolução🎉🎉🎉:  
>### 📝Check-List
>✅ 01) Criar conta e logar na Azure. Link: [https://azure.microsoft.com/pt-br](https://azure.microsoft.com/pt-br)  
>Utilizei a mesma conta ao qual acesso o Power BI Serviços;  
>✅ 02) Criar uma instancia de Banco de Dados Azure para MySQL (SGDB na nuvem)  
>Opções selecionadas:  
>- Criar ⇒ Serviços Gratuitos  
>- Banco de Dados do Azure para MySQL ⇒ Criar;  
>- Servidor flexível (My) ⇒ Criação Rápida;  
>
>✅ 03) Acessar o SGDB criado no Azure e criar o Banco de Dados (Esquemas, Tabelas e demais objetos do BD) desejado  
>Ações necessárias:  
>- O script de criação do db e de carga de dados precisaram de ajustes, pois havia comandos com sintaxe de erro e outros apresentavam >problemas de ordenação nos dados, devido a restrição de integridade; 
>- Realizar conexão com o BD MySQL do Azure recém criado;
>- Executar o script de criação da estrutura do banco de dados; 
>
>✅ 04) Fazer a carga da massa de dados disponível  
>- Executar o script de carga de dados;  
>  
>✅ 05) Acessar Power BI e fazer conexão com essa Base de Dados criada no Azure  
>Ações:  
>- É necessário ir nas configurações de **Rede** deste servidor Azure e configurar o Firewall, adicionando uma regra que permita todos os IPs.  
>OBS: Faça isso de forma temporária, apenas para os testes deste desafio.  
>- O parâmetro do servidor **require_secure_transport** deve ficar com o valor **ON**, uma vez que o firewall não fará bloqueio de IP Público.  
>- Baixar o certificado [DigiCertGlobalRootCA.crt.pem](https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem) para conseguir configurar o **MySQL Workbench** e acessar o Banco de Dados MySQL do Azure.  
>- Siga os passos na seleção /Configurações/**Conectar** do Menu lateral. Nessa área haverá uma parte dedicada a configuração do **MySQL Workbench**;  
>- No Power BI, selecione a opção **Obter Dados**, escolha a opção **Banco de Dados MySQL**. Clique em **Conectar**;
>- Abrirá uma tela solicitando informar:  
>   - **Servidor** ⇒ Informe a URL que consta na configuração do servidor criado;  
>   - **Banco de Dados** ⇒ Informe o Schema de dados que deseja acessar. É o mesmo que usa no comando **use**;  
>- Após clicar em conectar, abrirá outra tela para informar as credenciais. Selecione opção para informá-las;  
>- Selecione a faixa **Banco de Dados** e informe login e senha.  
  
  
> ## 🎲**Diretriz de Transformação dos Dados**:  
> ✅ 01) Ajustar cabeçalho e tipos de dados que não esteja em conformidade.  
> ✅ 02) Verificar a existência de nulos e analisar a remoção.  
> - Apenas o empregado James Borg está com matricula de supervisor nulo. Não houve necessidade de eliminar o dado, pois ele supervisiona ou é gerente de outros empregados, conforme dados analisados.  
>
> ✅ 03) Verificar se há algum departamento sem gerente.  
> - Verificado que todos os registros da tabela de departamento possuem valore de matricula de gerente que existe na tabela de empregados. Logo, este item está ok.  
>
> ✅ 04) Verificar o número de horas dos projetos.  
> - Utilizei a coluna do tipo tabela, que foi criada automaticamente na importação da tabela Project. Nela, fiz uma agregação selecionado apenas Soma de Hours.  
>
> ✅ 05) Separar colunas complexas.  
> - Uma parte desta ação já foi realizada no item anterior, fazendo uma agregação e gerando uma coluna totalizadora. As demais colunas complexas foram excluídas, uma vez que as próximas ações será para obter dados de outro modo, com a mesclagem.  
>
> ✅ 06) Mesclar consultas **employee** e **departament** para criar uma tabela **employee** que passará a possuir o **nome dos departamentos** associados aos colaboradores.  
A mescla terá como base a tabela employee.  
Neste processo, elimine as colunas desnecessárias!  
> - Realizada ação de *Mesclar Consultas* entre as tabelas utilizando o **número do departamento** como coluna comum entre elas. Ale´m disso, foi utilizado o *Tipo de Junção* correspondente ao *Left Join*, o que manteve a mesma quantidade de linhas da tabela employee como resultado.  
> - Uma vez que temos o nome do departamento nesta tabela de employee, não faz sentido manter o respectivo número/código. Portanto, foi excluído **número do departamento** da tabela employee.  
> - Para manter a coerência e o bom tratamento dos dados nos trabalhos a serem realizados no Power BI, essa mesma ação será realizada nas demais consultas/tabelas que possuem o **número do departamento**.  
>
> ✅ 07) Mesclar as colunas de **Nome**, **Nome do Meio** e **Sobrenome** para ter apenas uma coluna definindo os **Nomes dos Colaboradores**.  
> ✅ 08) Realizar a junção dos colaboradores e respectivos **nomes dos gerentes**.  
>Isso pode ser feito com consulta SQL ou pela mescla de tabelas com Power BI.  
>Caso utilize SQL, especifique aqui no README a query utilizada no processo.  
> - Esta ação realizei pela mescla de tabelas no Power BI.  
> - Entretanto, se eu fizesse por query, ficaria assim:
>```SQL
>select emp.Ssn Matr_Colaborador, concat(emp.Fname, " ", emp.Minit, " ", emp.Lname) Nome_Colaborador,
>	   emp.Super_ssn Matr_Gerente, concat(mgr.Fname, " ", mgr.Minit, " ", mgr.Lname) Nome_Gerente,
>       emp.Bdate Dat_Nasc, emp.Address Endereco, emp.Sex Sexo, emp.Salary Salario, emp.Dno Num_Depto
>from employee emp left join employee mgr on emp.Super_ssn = mgr.Ssn
>```
>
> ✅ 09) Mesclar os nomes de departamentos e localização. Isso fará com que cada combinação departamento-local seja único.  
>Isso irá auxiliar na criação do modelo estrela em um módulo futuro.  
> ✅ 10) Explicar por que, neste caso supracitado, podemos apenas utilizar o **mesclar** e não o **atribuir**.  
> - Uma vez que o objetivo da mesclagem, no item anterior, foi de ter o dado de departamento e local de forma distinta, a função de **mesclar** é mais adequada porque as duas colunas viram uma única e ao analisá-la teremos 5 valores distintos, uma vez que os departamento *Research* não será visto de forma isolada, passarão a ser vistos como **departamentos físicos** (departamento + Local) diferente, será o *Research de Houston*, o outro será *Research de Stafford* e etc. Se fosse a função **atribuir**, haveria apenas mais uma coluna que seria a junção das outras; possibilitando a visualização desses 3 departamentos físicos como sendo o mesmo departamento.  
>
> ✅ 11) Agrupe os dados a fim de saber quantos colaboradores existem por gerente.  
> - Com poucos dados, posso visualizar o agrupamento das colunas através da opção **Distribuição de Colunas** na faixa **Exibição**>>**Visualização dos Dados**. E visualizar todos os colaboradores de cada gerente.
> - Fiz pela forma mais prudente, realizei a função **mesclar** da tabela **employee** com ela própria, fazendo a junção entre o **nome do colaborador** e o **nome do gerente**. Na *coluna complexa* / *coluna mesclada* fiz a agregação pela opção de **Contagem(Não Branco) do Nome do Gerente**. Na sequência, renomei para **Quantidade de Subordinados** (qtd_subordinados).  
>
> ✅ 12) Eliminar as colunas desnecessárias, que não serão usadas no relatório, de cada tabela.  
  
> ## 📋**Entrega**:  
> 🎯Arquivo fonte do Power BI:  
> [Desafio_02_DIOeSuzano_PowerBI-CriandoUmDashboardCorporativoIntegradoMysqlAzure.pbix](./Desafio_02_DIOeSuzano_PowerBI-CriandoUmDashboardCorporativoIntegradoMysqlAzure.pbix)  
> 
> ou _Link_ para visualizá-lo online:  
> [Desafio_02_DIOeSuzano_PowerBI-CriandoUmRelatórioGerencialdeVendascomPowerBI_ONLINE](https://app.powerbi.com/groups/me/reports/20a72eb8-5356-4b61-908e-033fba482f7e/9ef8fc3f70a04d95a27a)  
>
>--- 
> 🎯Scripts de criação da estrutura dos dados (data base):  
> [script_criacao_banco_dados_company.sql](./dados/script_criacao_banco_dados_company.sql)  
>
> 🎯Scripts de carga dos dados:  
> [insercao_de_dados_e_queries.sql](./dados/insercao_de_dados_e_queries.sql)  

 ❗👏🎉Fim do Desafio 06