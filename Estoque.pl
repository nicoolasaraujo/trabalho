/*produtos ja em estoque (estoque mensal)*/
produto(001,'Achocolatado','Nescau',50,'Alimenticio',4.00).
produto(002,'Achocolatado','Toddy',30,'Alimenticio',3.00).
produto(003,'Arroz','Vasconcelos',20,'Alimenticio',5.00).
produto(004,'Feijão','cocal',30,'Alimenticio',6.00).
produto(005,'Açucar','Camil',20,'Alimenticio',6.00).
produto(006,'Refrigerante','Coca Cola',50,'Alimenticio',6.5).
produto(007,'Refrigerante','Kuat',30,'Alimenticio',6.00).
produto(008,'Suco','Fresh',200,'Alimenticio',0.5).
produto(009,'Suco','Del Valle',40,'Alimenticio',6.00).
produto(010,'Bolacha','Nikito',30,'Alimenticio',2.00).
produto(011,'Bolacha','Negresco',20,'Alimenticio',3.00).
produto(012,'Bolacha','Passatempo',30,'Alimenticio',2.0).
produto(013,'Desinfetante','Pinho',30,'Limpeza',5.28).
produto(014,'Desinfetante','Pato',35,'Limpeza',6.98).
produto(015,'Desinfetante','Sanol',35,'Limpeza',6.20).
produto(016,'Plaha de Aço','BomBril',50,'Limpeza',3.90).
produto(017,'Plaha de Aço','Ype',50,'Limpeza',3.78).
produto(018,'Plaha de Aço','Assolan',50,'Limpeza',4.08).
produto(019,'Esponja','ScotchBrite',45,'Limpeza',4.50).
produto(020,'Esponja','BomBril',45,'Limpeza',4.30).
produto(021,'Amaciante','Comfort',50,'Limpeza',6.90).
produto(022,'Amaciante','BomBril',45,'Limpeza',5.99).
produto(023,'Amaciante','Fofo',45,'Limpeza',6.29).
produto(024,'Amaciante','Soft',45,'Limpeza',5.99).
produto(025,'Amaciante','Tuff',50,'Limpeza',5.10).
produto(026,'Sabao em Po','Omo',60,'Limpeza',5.99).
produto(027,'Sabao em Po','Tixan Ype',32,'Limpeza',5.89).
produto(028,'Sabao em Po','Brihante',20,'Limpeza',6.18).
produto(029,'Sabao em Po','Ace',30,'Limpeza',5.50).

/*produtos vendidos no mes*/
venda(001,'Achocolatado','Nescau',40,'Alimenticio',6.00).
venda(002,'Achocolatado','Toddy',27,'Alimenticio',5.00).
venda(003,'Arroz','Vasconcelos',15,'Alimenticio',12.00).
venda(004,'Feijão','cocal',27,'Alimenticio',15.00).
venda(005,'Açucar','Camil',19,'Alimenticio',8.00).
venda(006,'Refrigerante','Coca Cola',49,'Alimenticio',8.00).
venda(007,'Refrigerante','Kuat',25,'Alimenticio',9.00).
venda(008,'Suco','Fresh',180,'Alimenticio',1.00).
venda(009,'Suco','Del Valle',37,'Alimenticio',6.00).
venda(010,'Bolacha','Nikito',29,'Alimenticio',3.00).
venda(011,'Bolacha','Negresco',19,'Alimenticio',4.00).
venda(012,'Bolacha','Passatempo',20,'Alimenticio',3.0).
venda(013,'Desinfetante','Pinho',27,'Limpeza',8.28).
venda(014,'Desinfetante','Pato',33,'Limpeza',7.98).
venda(015,'Desinfetante','Sanol',25,'Limpeza',8.20).
venda(016,'Plaha de Aço','BomBril',40,'Limpeza',3.90).
venda(017,'Plaha de Aço','Ype',30,'Limpeza',5.78).
venda(018,'Plaha de Aço','Assolan',49,'Limpeza',5.08).
venda(019,'Esponja','ScotchBrite',40,'Limpeza',6.50).
venda(020,'Esponja','BomBril',35,'Limpeza',5.30).
venda(021,'Amaciante','Comfort',30,'Limpeza',8.90).
venda(022,'Amaciante','BomBril',10,'Limpeza',7.99).
venda(023,'Amaciante','Fofo',30,'Limpeza',6.29).
venda(024,'Amaciante','Soft',25,'Limpeza',7.99).
venda(025,'Amaciante','Tuff',47,'Limpeza',9.10).
venda(026,'Sabao em Po','Omo',50,'Limpeza',6.99).
venda(027,'Sabao em Po','Tixan Ype',28,'Limpeza',7.89).
venda(028,'Sabao em Po','Brihante',19,'Limpeza',8.18).
venda(029,'Sabao em Po','Ace',21,'Limpeza',6.50).



help():- write('saldo(Marca,Produto,Retorno)\nporcentagem(Marca,Produto,Retorno)\nbens_estoque(29,Total)\nvendas(29,Total)\ndiferenca(29,Total)\nlocall(Marca,Codigo,Retorno,Produto)\npesquisar_prod(Produto,Marca)\nlistar(1)\nmaior_valor(29,Porcentagem)\ntop_vendas(29,Porcentagem,Produto,Marca)').


/*mostra o estoque atual produto-venda*/
saldo(X,R,Y):- produto(_,R,X,R1,_,_),venda(_,R,X,R2,_,_), Y is R1-R2.
definep(P,V,Z):- Z is (100*V)/P.
porcentagem(X,R,Y):- produto(_,R,X,R1,_,_),venda(_,R,X,R2,_,_), definep(R1,R2,Y).

/*se a diferença produto-venda for menor que 10% ele mostra*/
alerta_estoq(R1,R2):- R2=<(R1*10)/100.
saldo_critc(X,R,Y):- saldo(X,R,Y),
                     produto(_,R,X,R1,_,_),
                     alerta_estoq(R1,Y).

 /*calcula a qtd de produto*/
qtdxp(X,Y,Z):- Z is X*Y.
bens_estoque(001,X):- produto(001,_,_,U,_,P),
                     qtdxp(U,P,X).
bens_estoque(X,R):- X>1,
                    produto(X,_,_,U,_,P),
                    qtdxp(U,P,R1),
                    X1 is X-1,
                    bens_estoque(X1,R2),
                    R is R1 + R2,!.

/*produtos vendidos*/
vendas(001,X):- venda(001,_,_,U,_,P), qtdxp(U,P,X).
vendas(X,R):- X>1,
              venda(X,_,_,U,_,P),
              qtdxp(U,P,R1),
              X1 is X-1,
              vendas(X1,R2),
              R is R1 + R2,!.

/*diferença depois das vendas*/
diferenca(X,R):- vendas(X,R1),
                 bens_estoque(X,R2),
                 R is R1-R2,!.

/*local com poda */
f(X,'A1'):- X=<2,!.
f(X,'A2'):- X>2,X<6,!.
f(X,'A3'):- X>5, X<10,!.
f(X,'A4'):- X>=10, X<13, !.
f(X,'B1'):- X>=13, X=<15,!.
f(X,'B2'):- X>15, X=<18,!.
f(X,'B3'):- X>18, X=<20,!.
f(X,'B4'):- X>20, X=<25,!.
f(_,'B5').

locall(MARCA,COD,RETORNO,PRODUTO):- produto(COD,PRODUTO,MARCA,_,_,_),
                f(COD,RETORNO),!.





/*pesquisa informações pertinentes sobre um produto*/
pesquisar_prod(NOME,MARCA):- produto(COD,NOME,MARCA,UNI,CAT,_),
                             locall(MARCA,COD,R,NOME),
                             saldo(MARCA,NOME,Y),
                             venda(_,NOME,MARCA,_,_,PRE),
                             write('PRODUTO: '),write(NOME),nl,
                             write('MARCA: '),write(MARCA),nl,
                             write('CODIGO: '),write(COD),nl,
                             write('UNIDADES-INCIAL: '), write(UNI),nl,
                             write('UNIDADES-ATUAL: '), write(Y),nl,
                             write('CATEGORIA: '), write(CAT),nl,
                             write('PRECO: '), write(PRE),nl,
                             write('LOCAL: '), write(R),nl,nl,!.

pesquisar_prod(_,_):- write('NAO EXISTE'),nl.

/*lista todos os produtos*/
listar(029):- produto(029,NOME,MARCA,_,_,_),
                pesquisar_prod(NOME,MARCA).
listar(X):- X<29,produto(X,NOME,MARCA,_,_,_),
              pesquisar_prod(NOME,MARCA),
              X1 is X+1,
              listar(X1),!.


/*função para definir qual o maior valor entre duas entradas*/
maior(X,Y,X):- X>Y,!.
maior(_,Y,Y).
/*encontra o maior valor de acordo com a base de fatos*/
maior_valor(001,Y):- produto(001,R,_,R1,_,_),
                     venda(001,R,_,R2,_,_),
                     definep(R1,R2,Y).
maior_valor(X,Y):- X>1,
                   produto(X,R,_,R1,_,_),
                   venda(X,R,_,R2,_,_),
                   definep(R1,R2,Y1),
                   X1 is X-1,
                   maior_valor(X1,Y2),
                   maior(Y1,Y2,Y),!.

/*encontra a mercadoria que teve maior indice de venda*/
top_vendas(X,Y,N,M):- maior_valor(X,Y),
                      porcentagem(N,M,Y).
