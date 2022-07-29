SELECT * FROM Pets.dbo.Owners;
SELECT * FROM Pets.dbo.[P9-ProceduresDetails];
SELECT * FROM Pets.dbo.Pets;
SELECT * FROM Pets.dbo.ProceduresHistory;


--Extract information on pet names and owners names side by side
SELECT CONCAT(own.Name,' ',own.Surname) AS Owner_Name,pet.Name
FROM Pets.dbo.Owners AS own
INNER JOIN Pets.dbo.Pets AS pet ON own.OwnerID=pet.OwnerID;

--Find out which pet from this clinic had procedures performed
SELECT Name
FROM Pets.dbo.Pets AS pets
INNER JOIN Pets.dbo.ProceduresHistory AS pet_proc ON pets.PetID=pet_proc.PetID; 

--Matchup all the procedures performed to their descriptions
SELECT proc_his.PetID, proc_his.Date, proc_his.ProcedureSubCode, proc_his.ProcedureType, proc_info.Description
FROM Pets.dbo.ProceduresHistory AS proc_his 
LEFT JOIN Pets.dbo.[P9-ProceduresDetails] AS proc_info ON proc_his.ProcedureSubCode=proc_info.ProcedureSubCode;

--Same as above but only for pets from the clinic in question
SELECT proc_his.PetID, proc_his.Date, proc_his.ProcedureSubCode, proc_his.ProcedureType, proc_info.Description
FROM Pets.dbo.ProceduresHistory AS proc_his 
LEFT JOIN Pets.dbo.[P9-ProceduresDetails] AS proc_info ON proc_his.ProcedureSubCode=proc_info.ProcedureSubCode
Inner join Pets.dbo.Pets AS pets on pets.PetID=proc_his.PetID;

--Extract a table of indiavidual costs(procedure prices) incurred by owners of pets from the clinic in question(this table should have owner and procedure prices side by side)
SELECT CONCAT(own.NAME,' ',own.Surname),proc_info.ProcedureSubCode,proc_info.Description,proc_info.Price,pet.Name
FROM Pets.dbo.Owners as own
LEFT JOIN Pets.dbo.Pets AS pet ON own.OwnerID=pet.OwnerID
LEFT JOIN Pets.dbo.ProceduresHistory AS proc_his ON pet.PetID=proc_his.PetID
LEFT JOIN Pets.dbo.[P9-ProceduresDetails] AS proc_info ON proc_info.ProcedureSubCode=proc_his.ProcedureSubCode;








