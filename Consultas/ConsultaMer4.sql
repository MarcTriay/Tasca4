use MER4;
SELECT Client.Nom, Client.Cognom, Vendedor.Nom, Polissa.num_polisa, Tipos_Polissa.Tipos_Polissa
FROM Client, Vendedor, Polissa, Tipos_Polissa
Where Client.DNI = Polissa.client_DNI and Vendedor.DNI=Polissa.Vendedor_DNI and idTipos_Polissa = Polissa.Tipos_Polissa_idTipos_Polissa