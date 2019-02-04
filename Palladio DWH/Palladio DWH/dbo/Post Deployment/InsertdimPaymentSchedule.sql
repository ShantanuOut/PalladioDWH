IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.dimPaymentSchedule)
BEGIN
	INSERT INTO dbo.dimPaymentSchedule(StageCompletion, PercentageAgrCost)
	VALUES ('Miscleneous Charges', 0),
			('Before Agreement', 10),
			('Completion of slab - basement raft', 5),
			('Completion of slab- lower ground', 5),
			('Completion of slab- upper ground', 5),
			('Completion of slab - 1st Floor', 5),
			('Completion of slab– 3rd Floor', 4),
			('Completion of slab– 5th Floor', 4),
			('Completion of slab– 7th Floor', 4),
			('Completion of slab– 9th Floor', 4),
			('Completion of slab– 11th Floor', 4),
			('Completion of slab– 13th Floor', 4),
			('Completion of slab– 15th Floor', 4),
			('Completion of slab– 17th Floor', 4),
			('Completion of slab– 19th Floor', 4),
			('Completion of slab– 21st Floor', 4),
			('Completion of block work of the floor of the Said Apartment', 6),
			('Completion of internal plaster of the Said Apartment', 5),
			('Completion of Kitchen Otta in the Said Apartment', 5),
			('Completion of flooring in the Said Apartment', 5),
			('Completion of internal painting in the Said Apartment', 4),
			('Arch & Civil Completion of Said Apartment by Project Architect', 3),
			('Occupancy Certificate of Said Apartment by PCMC', 2)
END