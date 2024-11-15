CREATE TABLE School (
    SchoolID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    ContactInfo VARCHAR(50),
    PrincipalName VARCHAR(50);

INSERT INTO School (SchoolID, Name, Location, ContactInfo, PrincipalName) VALUES
(1, 'Greenfield Academy', 'Nairobi', '+254700123456', 'Jane Kimani'),
(2, 'Lakeside High', 'Kisumu', '+254700789012', 'John Wafula'),
(3, 'Sunrise Primary', 'Mombasa', '+254711223344', 'Grace Mwangi'),
(4, 'Hilltop School', 'Eldoret', '+254733445566', 'Peter Otieno'),
(5, 'Starlight Academy', 'Nakuru', '+254755667788', 'Lucy Kimani');

SELECT * FROM School;



