USE MER4;
Select Client.Nom as "Nom Client", Client.Cognom as "Cognom del Client", Polissa.num_polisa as "Nombre de Polissa"
FROM Client, Polissa
where Client. dni = Polissa.Client_dni and Client.Nom="Biel" and Client.Cognom="Marti";