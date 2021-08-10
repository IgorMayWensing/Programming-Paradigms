vestido(amarelo).
vestido(azul).
vestido(branco).
vestido(verde).
vestido(vermelho).

nomemae(eduarda).
nomemae(fatima).
nomemae(luciana).
nomemae(maria).
nomemae(valentina).

filho(francisco).
filho(jose).
filho(luis).
filho(roberto).
filho(tales).

idade(7).
idade(8).
idade(9).
idade(10).
idade(11).

comida(arrozdoce).
comida(cuzcuz).
comida(pamonha).
comida(pedemoleque).
comida(suspiro).

estado(alagoas).
estado(bahia).
estado(ceara).
estado(paraiba).
estado(sergipe).


%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).

%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X),
                        nth0(IndexY,Lista,Y),
                        IndexX < IndexY.

%X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista).

%X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :-

    ListaSolucao = [
        mae(Vestido1, Nomemae1, Filho1, Idade1, Comida1, Estado1),
        mae(Vestido2, Nomemae2, Filho2, Idade2, Comida2, Estado2),
        mae(Vestido3, Nomemae3, Filho3, Idade3, Comida3, Estado3),
        mae(Vestido4, Nomemae4, Filho4, Idade4, Comida4, Estado4),
        mae(Vestido5, Nomemae5, Filho5, Idade5, Comida5, Estado5)
    ],

    %luis esta na terceira pocisão
    Filho3 =luis,

    %Quem levou cuzcuz esta na seguda posição.
    Comida2 =cuzcuz,

    %A Valentina está na terceira posição.
    Nomemae3 =valentina,

    %O filho da Luciana tem 10 anos.
    member(mae(_,luciana,_,10,_,_), ListaSolucao),

    %A mae que levou Suspiro para a festa nasceu no estado cuja capital é Maceió.
    member(mae(_,_,_,_,suspiro,alagoas), ListaSolucao),

    %A mae de Roberto levou Pamonha para a festa.
    member(mae(_,_,roberto,_,pamonha,_), ListaSolucao),

    %A mulher do vestido Verde está exatamente à esquerda da mulher que nasceu na Bahia.
    aEsquerda(mae(verde,_,_,_,_,_), mae(_,_,_,_,_,bahia), ListaSolucao),
    aoLado(mae(verde,_,_,_,_,_), mae(_,_,_,_,_,bahia), ListaSolucao),

    %Valentina está exatamente à esquerda de Eduarda.
    aEsquerda(mae(_,valentina,_,_,_,_), mae(_,eduarda,_,_,_,_), ListaSolucao),
    aoLado(mae(_,valentina,_,_,_,_), mae(_,eduarda,_,_,_,_), ListaSolucao),

    %Quem levou Arroz doce está exatamente à esquerda da mae que nasceu em Alagoas.
    aEsquerda(mae(_,_,_,_,arrozdoce,_), mae(_,_,_,_,_,alagoas), ListaSolucao),
    aoLado(mae(_,_,_,_, arrozdoce,_), mae(_,_,_,_,_,alagoas), ListaSolucao),

    %A mae de Francisco está exatamente à esquerda da mae de Luis.
    aEsquerda(mae(_,_,francisco,_,_,_), mae(_,_,luis,_,_,_), ListaSolucao),
    aoLado(mae(_,_,francisco,_,_,_), mae(_,_,luis,_,_,_), ListaSolucao),

    %A mulher do vestido Amarelo está exatamente à esquerda da mae do filho de 11 anos.
    aEsquerda(mae(amarelo,_,_,_,_,_), mae(_,_,_,11,_,_), ListaSolucao),
    aoLado(mae(amarelo,_,_,_,_,_), mae(_,_,_,11,_,_), ListaSolucao),

    %A mulher que nasceu no ceara esta exatamente a esquerda da mulher que nasceu no estado cuja capital é Aracaju.
    aEsquerda(mae(_,_,_,_,_,ceara), mae(_,_,_,_,_,sergipe), ListaSolucao),
    aoLado(mae(_,_,_,_,_,ceara), mae(_,_,_,_,_,sergipe), ListaSolucao),

    %Roberto está exatamente à direita de quem levou Suspiro para a festa.
    aDireita(mae(_,_,roberto,_,_,_), mae(_,_,_,_,suspiro,_), ListaSolucao),
    aoLado(mae(_,_,roberto,_,_,_), mae(_,_,_,_,suspiro,_), ListaSolucao),

    %A mulher do vestido Vermelho está ao lado da mulher que nasceu em Sergipe.
    aoLado(mae(vermelho,_,_,_,_,_), mae(_,_,_,_,_,sergipe), ListaSolucao),

    %Luciana está ao lado da mae de Tales.
    aoLado(mae(_,luciana,_,_,_,_), mae(_,_,tales,_,_,_), ListaSolucao),

    %A mulher do vestido Azul está ao lado da mae do filho de 9 anos.
    aoLado(mae(azul,_,_,_,_,_), mae(_,_,_,9,_,_), ListaSolucao),

    %Fátima está ao lado da mae que nasceu em Alagoas.
    aoLado(mae(_,fatima,_,_,_,_), mae(_,_,_,_,_,alagoas), ListaSolucao),

    %A mae do garoto mais velho está em algum lugar à direita da mulher do vestido Azul.
    aDireita(mae(_,_,_,11,_,_), mae(azul,_,_,_,_,_), ListaSolucao),

    %A mae do filho de 8 anos está em algum lugar à direita da mulher do vestido Verde.
    aDireita(mae(_,_,_,8,_,_), mae(verde,_,_,_,_,_), ListaSolucao),

    %A mae do José está em algum lugar à direita da mulher do vestido Verde.
    aDireita(mae(_,_,jose,_,_,_), mae(verde,_,_,_,_,_), ListaSolucao),


    %Testa todas as possibilidades...
    vestido(Vestido1), vestido(Vestido2), vestido(Vestido3), vestido(Vestido4), vestido(Vestido5),
    todosDiferentes([Vestido1, Vestido2, Vestido3, Vestido4, Vestido5]),

    nomemae(Nomemae1), nomemae(Nomemae2), nomemae(Nomemae3), nomemae(Nomemae4), nomemae(Nomemae5),
    todosDiferentes([Nomemae1, Nomemae2, Nomemae3, Nomemae4, Nomemae5]),

    filho(Filho1), filho(Filho2), filho(Filho3), filho(Filho4), filho(Filho5),
    todosDiferentes([Filho1, Filho2, Filho3, Filho4, Filho5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    comida(Comida1), comida(Comida2), comida(Comida3), comida(Comida4), comida(Comida5),
    todosDiferentes([Comida1, Comida2, Comida3, Comida4, Comida5]),

    estado(Estado1), estado(Estado2), estado(Estado3), estado(Estado4), estado(Estado5),
    todosDiferentes([Estado1, Estado2, Estado3, Estado4, Estado5]).
