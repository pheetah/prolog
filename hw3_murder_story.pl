member(X,[X|_]).
member(X,[_|Y]) :- member(X,Y).

%smith,jones,williams
smithAndWilliams(S) :-
   S = [[smith,_,_],[jones,_,_],[williams,_,_]],
   member([jones,friend,_],S),
   member([williams,foe,_],S),
   member([smith,_,in],S),
   member([jones,_,in],S),
   member([williams,_,in],S).

smithAndJones(S) :-
   S = [[smith,_,_],[jones,_,_],[williams,_,_]],
   member([jones,friend,_],S),
   member([williams,foe,_],S),
   member([jones,strange,_],S),
   member([jones,_,out],S).

williamAndJones(S) :-
   S = [[smith,_,_],[jones,_,_],[williams,_,_]],
   member([jones,strange,_],S),
   member([jones,_,out],S),
   member([smith,_,in],S),
   member([jones,_,in],S),
   member([williams,_,in],S).
   

suspectSmith(S) :- not(smithAndWilliams(S)), not(smithAndJones(S)), format('murderer is smith').
suspectJones(S) :- not(smithAndJones(S)), not(williamAndJones(S)), format('murderer is jones').
suspectWilliams(S) :- not(smithAndWilliams(S)), not(williamAndJones(S)),format('murderer is williams').

murderCheck(S) :- suspectSmith(S).
murderCheck(S) :- suspectJones(S).
murderCheck(S) :- suspectWilliams(S).

%murderCheck([A,B,C]).