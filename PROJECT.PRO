%trace
domains
   FILE = finput;foutput
   tls = string*
   tlist=tip(integer,string)
   tlif = tlist*
   
   % Salvare rezultate in RAM
   database - db_cuv
   
   % Predicat -> cuvintele din fisier
   token(string)
   
   % Predicat -> numele fisierelor alese
   nmfsa(string)
   
   % Predicat -> cuvant si frecventa specifica
   cuv_frecv(integer, string)
   
   % Predicat -> cuvant si frecventa literelor acestora
   nr_lit_cuv(integer, string)
   
predicates
   % Predicat recursiv -> simulare bucla infinita
   run
   
   % Predicat -> Preluare optiune de lucru
   prel_opt(string)
   
   % Predicat -> Interpretare optiune
   exe_opt(string)
   exe_opt_opt(string)
   exe(string,tls,tls)
   
   % Predicat -> Validare optiune
   valid_opt(string)
   valid_opt_2(string)
   
   % Predicat -> afiseaza elementele dintr-o baza de fapte in acord cu capacitatea ferestrei active
   % Parametrul -> input-numarul de linii disponibile in fereastra activa
   typels(integer, tlif)
   
   
   % Predicat -> primeste ca input lista tokenilor, obtinuta utilizand fronttoken, iar potentialii separatori sunt eliminati
   wrf(tls,tls)
   
   % Predicat -> afiseaza pe ecran, recursiv o lista de cuvinte, si se bazeaza pe o fereastra cu nr specificat de linii
   disp(integer,tls)
   
   
   lowerupp(tls,tls)
   
   % Predicat -> convertire a cuvintelor din litere mici in majuscule,
   % si se bazeaza pe o fereastra cu nr specificat de linii
   dispupper(integer, tls)
   
   % Predicatul primeste ca parametru fiecare linie din fisier
   % si apeleaza fronttonken care face tokenizare pentru fiecare linie.
   % De asemenea, face convertirea cuvintelor din majuscule in litere mici
   % si insereaza in baza de fapte fiecare cuvant
   tokline(string)
   
   % Predicat -> citirea linie cu linie dintr-un fisier
   tokfis(file)
   
   % Predicatul -> deschiderea fisierului de citire dupa
   % un nume preluat din baza de fapte
   preptok(file)
   
   % Predicat -> afisarea fiecarui cuvant si a frecventei specifice, apeleaza predicatul de contorizare, si sterge
   % din lista cuvintele care apar deja, adaugand astfel intr-o baza de fapte cuvantul si frecventa.
   % De asemenea se scrie si in fisier
   save_list_frecv(tls, tls)
   
   % Predicat -> sorteaza o lista descendent
   sort_list_desc(tlif,tlif)
   
   % Predicat -> sorteaza o lista ascendent
   sort_list_asc(tlif,tlif)
   
   % Predicat -> cel mai des cuvant
   cmd_cuv(tlif)
   
   % Predicat -> cel mai rar cuvant
   cmr_cuv(tlif)
   
   % Predicat -> frecventa unui cuvant specificat
   ap_cuv_spec(string, tls)

   % Predicat -> numarul de litere al cuvintelor dintr-o lista si afiseaza lungimea fiecarui cuvant
   nr_litere_cuv(string,tls)
   
   % Predicat -> lungimea unui cuvant
   nr_litere(string,integer)
   
   % Predicat -> contureaza principiul de salvare intr-un fisier in 5 pasi
   cr_fis(string,tls,tls)
   
   % Predicat ->  numarare a cuvintelor din text
   num_cuv(tls,integer)
   
   % Predicat -> numarului de cuvinte din text
   afis_nr_cuv(integer)
   
   % Predicat -> repetarea anumitor secvente
   repeat
   
   % Predicat -> contorizarea aparitiilor unui sir de caractere intr-o lista de siruri de caractere
   cont_as_in_ls(string,tls,integer)
   
   % Predicat -> insereaza in baza de fapte numele initial al fisierului din care se face citirea
   inserare_nmfsa
   
   % Predicat care returneaza o lista rezultat in urma stergerii cuvinteor a caror aparitie deja exista
   del_tok(string,tls,tls)
   
   %Sortarea descendenta a elementelor listei
   sort_lif_desc(tlif,tlif)
   
   % Se verifica starea de sortare a elementelor listei; daca predicatul
   % intoarce true rezulta ca lista este sortata;
   % daca predicatul intoarce false inseamna ca lista nu este inca sortata
   fals_desc(tlif)
   
   % Se parcurge lista si acolo unde este necesar se face interschimbarea elementelor
   % doua cate doua, consecutive. 
   % Argumentele: primul -> lista inainte de parcurgere si schimbare.
   %              al doilea -> Lista rezultat 
   schmb_desc(tlif,tlif)
   
   % Sortarea ascendenta a elementelor listei.
   sort_list_frecv_asc(tlif,tlif)
   
   % Se verifica starea de sortare a elementelor listei, iar daca
   % predicatul intoarce true inseamna ca lista este sortata;
   % Daca predicatul intoarce false inseamna ca lista nu este inca sortata
   fs_asc(tlif)
   
   % Se parcurge lista si acolo unde este necesar se face interschimbarea elementelor
   % doua cate doua, consecutive. 
   % Argumentele: primul -> lista inainte de parcurgere si schimbare.
   %              al doilea -> Lista rezultat 
   schmb_asc(tlif,tlif)
   
   % Predicat -> cuvintele si frecventa
   af_frecv(integer,string)
   
   % Generare lista de frecvente a cuvintelor
   gen_frecv(tls, tls, tlif)
   
   % Predicat -> generare numar litere
   gen_nr_lit(tls, tls, tlif)
   
   % Predicat  -> citire a listei de frecvente
   cit_list_frecv(tlif)
   
   % Predicat -> salvare in fisier
   salvInFis(tls,tls)
   
   clauses
    num_cuv([],0).
	num_cuv([_|List],Nr):-
	num_cuv(List,Nr2),
	Nr = 1+Nr2.
	
	afis_nr_cuv(Nr):-
	write("Numarul de cuvinte din text este: ", Nr).
	
	del_tok(_,[],[]).
	del_tok(Str,[Str|RestList],LI):-
	del_tok(Str,RestList,LI).
	del_tok(Str,[Cap|RestList],[Cap|LI]):-
	del_tok(Str,RestList,LI).
	repeat.
	repeat:-repeat.
	wrf([],[]).
	
	wrf([Tok|Rest],[Tok|RestI]):-
      Tok<>".",
      Tok<>"%",
      Tok<>",",
      Tok<>"(",
      Tok<>")",
      Tok<>":",
      Tok<>"[",
      Tok<>"]",
      Tok<>"=",
      Tok<>"*",
      Tok<>"-",
      Tok<>"_",
      Tok<>"|",
      Tok<>"\\",
      Tok<>"\"",
      Tok<>">",
      Tok<>"<",
    wrf(Rest,RestI).
 
    wrf([_|Rest],LI):-
    wrf(Rest,LI).

 preptok(finput):-
 nmfsa(Cuvant),
 openread(finput,Cuvant),
 readdevice(finput).

 tokfis(finput):-
 repeat, readln(Linie),
 tokline(Linie),
 eof(finput).

 tokfis(finput):-
 closefile(finput).

 tokline(Linie):-
 fronttoken(Linie,Token,Rest),
 upper_lower(Token,Tkn),
 assert(token(Tkn)),
 tokline(Rest).
tokline(_).

disp(_,[]).

disp(NL,[Cap|Rest]):-
 cursor(Lin,_),
 Lin<NL,
 write(Cap),nl,
 disp(NL,Rest).
 
disp(NL,[Cap|Rest]):-
 write("Apasa <ENTER> pentru continuare..."),
 readchar(_),
 clearwindow,
 disp(NL,[Cap|Rest]).
 
 dispupper(_,[]).
 dispupper(NL,[Cap|Rest]):-
 cursor(Lin,_),
 Lin<NL,
 upper_lower(Upp,Cap),
 write(Upp),nl,
 dispupper(NL,Rest).
 
 dispupper(NL,[Cap|Rest]):-
 write("Apasa <ENTER> pentru continuare..."),
 readchar(_),
 clearwindow,
 dispupper(NL,[Cap|Rest]).
 
 lowerupp([],[]).
 lowerupp([Str|List],[Low|ListM]):-
 upper_lower(Str,Low),
 lowerupp(List,ListM).
 
 gen_frecv([],[],[]).
 gen_frecv([],_,[]).
 gen_frecv([A|_],Lista2,[tip(Nr,Sr)|List]):-
 cont_as_in_ls(A,Lista2,NrAp),
 del_tok(A,Lista2,ListaM),
 assert(cuv_frecv(NrAp,A),db_cuv),
 Nr = NrAp,
 Sr = A,
 gen_frecv(ListaM,ListaM,List).
 
 gen_nr_lit([],[],[]).
 gen_nr_lit([],_,[]).
 gen_nr_lit([A|_],[B|List],[tip(Nr,Sr)|List1]):-
    nr_litere(B,NrAp),
	del_tok(A,List,ListaM),
	assert(nr_lit_cuv(NrAp,B),db_cuv),
    Nr = NrAp,
    Sr = b,
    gen_nr_lit(ListaM,ListaM,List1).

    cit_list_frecv([]).
    cit_list_frecv([tip(Nr,Sr)|List]):-
    write("Frecventa: ", Nr, " corespunde cuvantului: ", '"', Sr, '"'),nl,
	cit_list_frecv(List).
	
	% Lista nu este goala, iar elemtul din capul listei 
	% se afiseaza doar daca mai incape in fereastra.
	typels(_,[]).
	typels(NLD,[tip(NrAp,Sr)|List]):-
	  cursor(LC,_),
	  LC<NLD,
	  af_frecv(NrAp,Sr),
	  typels(NLD,List).
	  
	typels(NLD,[tip(NrAp,Sr)|List]):-
	  write("Apasa <ENTER> pentru continuare..."),
	  readchar(_),
	  clearwindow,
	  typels(NLD,[tip(NrAp,Sr)|List]).
	  
	  af_frecv(NrAp,A):-
	  NrAp<>1,
	  write("Cuvantul: ",'"', A, '"'," apare de ", NrAp, " ori."),nl.
	  
	  af_frecv(_,A):-
	  write("Cuvantul: ",'"',A,'"'," apare o singura data."),
	  nl.
	  
	  save_list_frecv([],[]).
	  save_list_frecv([],_).
	  
	  save_list_frecv([A|_],Lista2):-
	  cont_as_in_ls(A,Lista2,NrAp),
	  del_tok(A,Lista2,ListaM),
	  assert(cuv_frecv(NrAp,A),db_cuv),
	  NrAp <> 1,
	  write("Cuvantul: ", '"',A, '"'," apare de ",NrAp," ori."),
	  nl,
	  save_list_frecv(ListaM,ListaM).
	  save_list_frecv([A|List1],List2):-
	  write("Cuvantul: ", '"', A, '"'," apare o singura data."),
	  nl,
	  save_list_frecv(List1, List2).


      sort_lif_desc(LI,LI):-
       fals_desc(LI).

      sort_lif_desc(LI,LO):-
       schmb_desc(LI,LP),
       sort_lif_desc(LP,LO).

      fals_desc([_]).
      fals_desc([tip(VC1,_), tip(VC2,P2)|RL]):-
         VC1>=VC2,
         fals_desc([tip(VC2,P2)|RL]).
		 schmb_desc([E],[E]).
		 
	schmb_desc([tip(VC1,P1),tip(VC2,P2)|RLI], [tip(VC2,P2)|RLO]):-
       VC1<VC2,
       schmb_desc([tip(VC1,P1)|RLI],RLO).
       schmb_desc([tip(VC1,P1), tip(VC2,P2)|RLI], [tip(VC1,P1)|RLO]):-
       VC1>=VC2,
       schmb_desc([tip(VC2,P2)|RLI],RLO).

    sort_list_desc([],[]).
    sort_list_desc(L,LS):-
	  sort_lif_desc(L,LS),
	  nl,
	  write(LS),
	  readchar(_).
	  
	cmd_cuv([tip(Nr,Sr)|_]):-
	   nl,nl,
	   write("Cel mai des cuvant intalnit(primul) este: ",'"',Sr,'"'," cu frecventa de: ", Nr),
	   nl.
	   
	sort_list_frecv_asc(LI,LI):-
       fs_asc(LI).

    sort_list_frecv_asc(LI,LO):-
       schmb_asc(LI,LP),
       sort_list_frecv_asc(LP,LO).

    fs_asc([_]).
    fs_asc([tip(VC1,_), tip(VC2,P2)|RL]):-
       VC1<=VC2,
       fs_asc([tip(VC2,P2)|RL]).
       schmb_asc([E],[E]).

    schmb_asc([tip(VC1,P1),tip(VC2,P2)|RLI], [tip(VC2,P2)|RLO]):-
       VC1>VC2,
       schmb_asc([tip(VC1,P1)|RLI],RLO).
       schmb_asc([tip(VC1,P1),tip(VC2,P2)|RLI],[tip(VC1,P1)|RLO]):-
       VC1<=VC2,
       schmb_asc([tip(VC2,P2)|RLI],RLO).

    sort_list_asc([],[]).
    sort_list_asc(L,LS):-
      sort_list_frecv_asc(L,LS),
      nl,
      write(LS),
      readchar(_).

    cmr_cuv([tip(Nr,Sr)|_]):-
      nl,nl,
      write("Cel mai rar cuvant(primul) este: ", '"', Sr, '"'," cu frecventa de: ", Nr),
      nl.


	ap_cuv_spec(Str, List):-
	cont_as_in_ls(Str,List,NrAp),
	NrAp <> 0,
	write("Cuvantul ", '"',Str,'"', " apare de: ", NrAp, " ori."),nl.
	
	ap_cuv_spec(_,_):-
	write("Cuvantul nu exista in textul curent.").
	
	nr_litere(B,NrAp):-
	  str_len(B,NrAp).
	  
	nr_litere_cuv(Str,[A|_]):-
	  Str = A,
	  str_len(A,Nr),
	  nl,
	  write("  Lungimea cuvantului ales este de: ", Nr, " litere."),nl.
	  
	  nr_litere_cuv(_,[]):-
	  write(" Cuvantul nu exista in textul curent.").
	  
	  
	nr_litere_cuv(Str, [A|List]):-
	     Str <> A,
		 nr_litere_cuv(Str, List).
		 
    % Regula de oprire a parcurgerii recursive a listei
	cont_as_in_ls(_,[],0).
	
	% Explorarea recursiva a listei pentru contoriza elementele
	% din capul listei egale cu sirul cautat
	cont_as_in_ls(Sir,[H|T],NrAp):-
	  Sir=H,
	  cont_as_in_ls(Sir,T,NrApI),
	  NrAp=NrApI+1.
	  
    % Continuarea explorarii recursive a listei in cazul in care capul listei
	% difera de elementul cautat
	cont_as_in_ls(Sir,[H|T],NrAp):-
	 Sir<>H,
	 cont_as_in_ls(Sir,T,NrAp).
	 
	 salvInFis(List1,List2):-
	 retractall(cuv_frecv(_,_), db_cuv),
	 save_list_frecv(List1,List2),
	 readchar(_).
	  
	 
	 cr_fis(NF,List1, List2):-
	 openwrite(foutput, NF),
	 writedevice(foutput),
	 salvInFis(List1, List2),
	 closefile(foutput),
	 writedevice(screen).
	 
	 run:-
	 prel_opt(Opt),
	 retractall(token(_),db_cuv),
	 preptok(finput),
	 tokfis(finput),
	 closefile(finput),
	 readdevice(keyboard),
	 exe_opt(Opt),
	 run.
	 
	 inserare_nmfsa:-
	    assert(nmfsa("toatet.txt"),db_cuv),
		

		makewindow(1,31,23,"DESPRE APLICATIE",3,3,20,75),
		cursor(1,2), write("*-------------------------------------------------------------------*"),
        cursor(2,2), write("|                                                                   |"),
         cursor(3,2),write("|    #####      #####      #####    #           #####      ######   |"),
         cursor(4,2),write("|   #     #    #     #    #     #   #          #     #    #         |"),
         cursor(5,2),write("|   ######     ######     #     #   #          #     #    #  ####   |"),
         cursor(6,2),write("|   #          #   #      #     #   #          #     #    #     #   |"),
         cursor(7,2),write("|   #          #    #      #####    #######     #####      #####    |"),
         cursor(8,2),write("|                                                                   |"),                                                                                                                        
		 cursor(9,2),write("|    TEMA PROIECT: ANALIZA STATISTICA A CUVINTELOR DINTR-UN TEXT    |"),
		cursor(10,2),write("|                                                                   |"),
		cursor(11,2),write("|    STUDENT: Epure Alexandru Cristian                              |"),
		cursor(12,2),write("|    TI, 4LF391A                                                    |"),
		cursor(13,2),write("|    PROFESOR COORDONATOR: Prof. Dr. Dorin BOCU                     |"),
		cursor(14,2),write("|                                                                   |"),
		cursor(15,2),write("|                   Press any key to continue...                    |"),
	    cursor(16,2),write("*------------------------------V.1.0.-------------------------------*"),
		cursor(15,50),
		readchar(_).
		
		
		prel_opt(Opt):-
		makewindow(1,31,23,"Meniu principal",3,3,20,75),
		cursor(0,2) ,write("*-------------------------------------------------------------------*"),
		cursor(1,2) ,write("| 1  - Selecteaza text.                                             |"),
		cursor(2,2) ,write("| 2  - Afisarea cuvintelor din text.                                |"),
		cursor(3,2) ,write("| 3  - Afisarea cuvintelor cu majuscule (UPPER)                     |"),
		cursor(4,2) ,write("| 4  - Afisarea numarului de cuvinte din text                       |"),
		cursor(5,2) ,write("| 5  - Afisarea celui mai des cuvant (Prima intrare)                |"),
		cursor(6,2) ,write("| 6  - Afisarea celui mai rar cuvant (Prima intrare)                |"),
		cursor(7,2) ,write("| 7  - Numarul de aparitii al unui cuvant citit de la tastatura.    |"),
		cursor(8,2) ,write("| 8  - Afisarea numarului de litere pentru un cuvant specificat.    |"),
		cursor(9,2) ,write("| 9  - Generarea numarului de aparitii al fiecarui cuvant.          |"),
		cursor(10,2),write("| 10 - Afisarea lista de frecventa sortata ascendent.               |"),
		cursor(11,2),write("| 11 - Afisarea lista de frecventa sortata descendent.              |"),
		cursor(12,2),write("| 12 - Salvare in fisier a listei de frecventa.                     |"),
		cursor(13,2),write("|                                                                   |"),
		cursor(14,2),write("|                                                     13 - Exit     |"),
		cursor(15,2),write("|                   Alegeti o optiune (1-13)  _                     |"),
		cursor(16,2),write("*--------------------------------V.1.0------------------------------*"),
		cursor(15,48),
		readln(Opt),
		valid_opt(Opt),!.
		
		prel_opt(Opt):-
		 cursor(17,2),write("Optiune eronata...Alege alta optiune! Apasa <ENTER> pentru continuare"),
		 readchar(_),
		 prel_opt(Opt),!.
		 
		 valid_opt(Opt):-
		 Opt="1";
		 Opt="2";
		 Opt="3";
		 Opt="4";
		 Opt="5";
		 Opt="6";
		 Opt="7";
		 Opt="8";
		 Opt="9";
		 Opt="10";
		 Opt="11";
         Opt="12";
		 Opt="13".
		 
		 valid_opt_2(Opt):-
		 Opt="1";
		 Opt="2";
		 Opt="3";
		 Opt="4".
		 
		 valid_opt_2(_):-
		   cursor(12,2),
		   write("Optiune eronata").
		   
		   
		   exe_opt("1"):-
		   makewindow(2,30,31,"Alege textul",4,4,18,73),
		   cursor(1,2),
		   write("1 - Poezie - Toate trec - dorin.bocu.ro/blog/"),
		   cursor(3,2),
		   write("2 - Poezie - Omul simplu - dorin.bocu.ro/blog/"),
		   cursor(5,2),
		   write("3 - Citat - Sursa: dorin.bocu.ro/blog/"),
		   cursor(7,2),
		   write("4 - Citat - Viata - Antoine de Saint-Exupery"),
		   cursor(13,2),
		   write("Alegeti o optiune: "),
		   readln(Opt),
		   valid_opt_2(Opt),
		   exe_opt_opt(Opt),
		   removewindow.
		   
		   exe_opt("2"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista, Lista2),
		   makewindow(2,30,31,"Afisarea cuvintelor din text",4,4,18,73),
		   disp(15,Lista2),nl,
		   write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
           exe_opt("3"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Afisarea cuvintelor cu majuscule",4,4,18,73),
		   write("Afisarea cuvintelor cu majuscule"),nl,
		   dispupper(15,Lista2),
		   write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		   exe_opt("4"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Afisarea numarului de cuvinte din text", 4,4,18,73),
		   num_cuv(Lista2,Nr),nl,
		   afis_nr_cuv(Nr),nl,
		   write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		   exe_opt("5"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Afisarea celui mai des cuvant (Prima intrare)", 4,4,18,73),
		   retractall(cuv_frecv(_,_),db_cuv),
		   gen_frecv(Lista2,Lista2,LI),nl,
		   write("Se generaza lista cu frecventele cuvintelor.......................ok"),nl,
		   write("Se genereaza lista cu frecventele cuvintelor sortata descendent...ok "),nl,nl,
		   write("Lista sortata descendent: "),nl,
		   sort_list_desc(LI,LO),
		   cmd_cuv(LO),
		   write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		   
		   exe_opt("6"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Afisarea celui mai rar cuvant (Prima intrare)", 4,4,18,73),
		   retractall(cuv_frecv(_,_),db_cuv),
		   gen_frecv(Lista2,Lista2,LI),nl,
		   write("Se generaza lista cu frecventele cuvintelor.......................ok"),nl,
		   write("Se genereaza lista cu frecventele cuvintelor sortata asccendent...ok "),nl,nl,
		   write("Se afiseaza lista sortata cu frecvente sortata ascendent"),nl,
		   sort_list_asc(LI,LO),
		   cmr_cuv(LO),
		   nl,
           write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		   exe_opt("7"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Numarul de aparitii al unui cuvant citit de la tastatura", 4,4,18,73),
		   cursor(1,2),write("Citire de la tastatura a cuvantului: "),
		   readln(Str),
		   ap_cuv_spec(Str,Lista2),
		   nl,
		   write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		   
		   exe_opt("8"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Numarul de litere al unui cuvant citit de la tastatura",4,4,18,73),
		   cursor(1,2),write("Citire de la tastatura a cuvantului: "),
		   readln(Str),
		   nr_litere_cuv(Str,Lista2),
		   nl,
		   write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		   exe_opt("9"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Generarea numarului de aparitii al fiecarui cuvant.",4,4,18,73),
		   retractall(cuv_frecv(_,_),db_cuv),
		   gen_frecv(Lista2, Lista2, LI),nl,
		   typels(15,LI),nl,
		   write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		  
		   
		   exe_opt("10"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Sortare lista ascendent dupa numarul de aparitii", 4,4,18,73),
		   retractall(cuv_frecv(_,_),db_cuv),
		   gen_frecv(Lista2,Lista2,LI),
		   write("Lista sortata ascendent: "),nl,
		   sort_list_asc(LI,_),
		   nl,
		   nl,
           write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		   exe_opt("11"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31,"Sortare lista descendent dupa numrul de aparitii", 4,4,18,73),
		   retractall(cuv_frecv(_,_),db_cuv),
		   gen_frecv(Lista2,Lista2,LI),
		   write("Lista sortata descendent: "),nl,
		   sort_list_desc(LI,_),
		   nl,
		   nl,
		   write("Press any key to continue..."),
		   readchar(_),
		   removewindow.
		   
		    exe_opt("12"):-
		   findall(Cuvant,token(Cuvant),Lista),
		   wrf(Lista,Lista2),
		   makewindow(2,30,31, "Salvare in fisier",4,4,18,73),
		   retractall(cuv_frecv(_,_),db_cuv),
		   gen_frecv(Lista2, Lista2, _),nl,
		   write("Se doreste salvarea in fisier? (da/nu): "),nl,nl,
		   write("<da> - Pentru scriere in fisier"),nl,
		   write("<nu> - Pentru a renunta"),nl,
		   readln(Optiune),
		   exe(Optiune,Lista2,Lista2),
		   removewindow.
		   
		   exe_opt("13"):-
		   removewindow,
		   makewindow(1,31,23,"Iesire din program",3,3,20,75),
		cursor(1,2), write("*-------------------------------------------------------------------*"),
        cursor(2,2), write("|                                                                   |"),
         cursor(3,2),write("|    #####      #####      #####    #           #####      ######   |"),
         cursor(4,2),write("|   #     #    #     #    #     #   #          #     #    #         |"),
         cursor(5,2),write("|   ######     ######     #     #   #          #     #    #  ####   |"),
         cursor(6,2),write("|   #          #   #      #     #   #          #     #    #     #   |"),
         cursor(7,2),write("|   #          #    #      #####    #######     #####      #####    |"),
         cursor(8,2),write("|                                                                   |"),                                                                                                                        
		 cursor(9,2),write("|                          VA MULTUMESC!                            |"),
		cursor(10,2),write("|                                                                   |"),
		cursor(11,2),write("|    STUDENT: Epure Alexandru Cristian                              |"),
		cursor(12,2),write("|    TI, 4LF391A                                                    |"),
		cursor(13,2),write("|    PROFESOR COORDONATOR: Prof. Dr. Dorin BOCU                     |"),
		cursor(14,2),write("|                                                                   |"),
		cursor(15,2),write("|                     Press any key to exit...                      |"),
	    cursor(16,2),write("*------------------------------V.1.0.-------------------------------*"),
		cursor(15,48),
		   readchar(_),
		   exit(0),
		   fail,
		   removewindow.
		   
		   
		   exe_opt_opt("1"):-
		   retractall(nmfsa(_),db_cuv),
		   assert(nmfsa("toatet.txt"),db_cuv),
		   makewindow(2,30,31,"Toate trec (http://www.dorin.bocu.ro/)",5,6,16,70),
		   write("Fisierul selectat: toatet.txt"),nl,
		   write("Poezia este: TOATE TREC (http://www.dorin.bocu.ro/)"),nl,nl,
		   write("Apasati <ENTER> pentru continuare"),
		   readchar(_),
		   removewindow.
		   
		  exe_opt_opt("2"):-
		   retractall(nmfsa(_),db_cuv),
		   assert(nmfsa("simplu.txt"),db_cuv),
		   makewindow(2,30,31,"Omul simplu (http://www.dorin.bocu.ro/)",5,6,16,70),
		   write("Fisierul selectat: simplu.txt"),nl,
		   write("Poezia este: OMUL SIMPLU (http://www.dorin.bocu.ro/)"),nl,nl,
		   write("Apasati <ENTER> pentru continuare"),
		   readchar(_),
		   removewindow.
		   
		   exe_opt_opt("3"):-
		   retractall(nmfsa(_),db_cuv),
		   assert(nmfsa("citat1.txt"),db_cuv),
		   makewindow(2,30,31,"Citat - http://www.dorin.bocu.ro/",5,6,16,70),
		   write("Fisierul selectat: citat1.txt"),nl,
		   write("Citatul este: Citatat 1 (http://www.dorin.bocu.ro/)"),nl,nl,
		   write("Apasati <ENTER> pentru continuare"),
		   readchar(_),
		   removewindow.
		   
		   exe_opt_opt("4"):-
		   retractall(nmfsa(_),db_cuv),
		   assert(nmfsa("viata.txt"),db_cuv),
		   makewindow(2,30,31,"Citat - Antoine de Saint-Exupery",5,6,16,70),
		   write("Fisierul selectat: viata.txt"),nl,
		   write("Citatul este despre viata - Antoine de Saint-Exupery "),nl,nl,
		   write("Apasati <ENTER> pentru continuare"),
		   readchar(_),
		   removewindow.
		   
		   exe_opt_opt(_):-
		   readchar(_).
		   
			
			exe("da",List1,List2):-
			makewindow(2,30,31,"Salvare in fisier",4,4,18,73),
			write("Salvarea in fisier al numarului de aparitii al fiecarui cuvant din text."),nl,
			cr_fis("backup.txt",List1,List2),
			write("Fisierul s-a salvat cu succes."),
			nl,
			write("Apasati <ENTER> pentru continuare"),
			readchar(_),
			removewindow.
			
			
			exe("nu",_,_):-
			write("Actiunea de scriere in fisier a fost anulata!"),nl,nl,
			write("Apasati <ENTER> pentru continuare"),
			readchar(_),
			removewindow.
			
			exe(_,_,_):-
			cursor(12,2),
			write("Optiune eronata"),
			readchar(_).
			
			
			goal
			 clearwindow,
			 inserare_nmfsa,
			 run.
			



          			
		   
		
	 
    	  
  	
 
 


      
   
   