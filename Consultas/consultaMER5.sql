use MER5;
SELECT Clients.nom, Vehicle.marca, tipos_vehicle.nom, Citas.Data_inici, Citas.lloc, Client_Vehicle.data_fi
FROM Clients, Vehicle, tipos_vehicle, Citas, Client_Vehicle
Where Clients.DNI=Client_Vehicle.Clients_DNI AND
	tipos_vehicle.id=Vehicle.tipos_vehicle_id1 