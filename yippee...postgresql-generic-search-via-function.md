OBJECTIVE:

Build a generic function that can take parameters as variables and perform a query for the where "column name as parameterized variable" = "value as parameterized variable"



# 1: Returns SETOF ... CHECKED through ssh/psql and adminer interface ... works :):) ... took 3 days!!!!!... BUT did not work with Boomi
```
DROP FUNCTION queryone(TEXT, TEXT);
CREATE OR REPLACE FUNCTION queryone (TEXT, TEXT)

RETURNS SETOF iotplanner AS

$$

BEGIN

RETURN QUERY EXECUTE 'SELECT * FROM iotplanner WHERE ' || quote_ident($1) || ' = ' || quote_literal($2);

END;

$$ LANGUAGE plpgsql;

SELECT * FROM queryone('state','Karnataka');
```

# 2: Returns TABLE ... CHECKED through ssh/psql and adminer interface ... works :):) and also with Boomi, where parameters are defined and are inserted as ?

* Adminer example:
```
DROP FUNCTION queryone(varchar, varchar);
CREATE OR REPLACE FUNCTION queryone (varchar, varchar)

RETURNS TABLE ( city text, drivername text, driverphone text, driverphotoid text, earliestinstallation date, enginenumber text, estimateddelivery date, fleetmanager text, fleetmanageremailaddress text, fleetmanagerphone text, gpsterminalnumber text, id int, installationcomments text, installationprovidercontactname text, installationprovideremail text, installationproviderphone text, installationstatus text, installer text, installeremail text, installerphone text, installerphotoid text, orderid text, orderstatus text, pincode text, state text, vehicleregistrationnumber text, vehicletype text ) AS

$$

BEGIN

RETURN QUERY EXECUTE 'SELECT city, drivername, driverphone, driverphotoid, earliestinstallation, enginenumber, estimateddelivery, fleetmanager, fleetmanageremailaddress, fleetmanagerphone, gpsterminalnumber, id, installationcomments, installationprovidercontactname, installationprovideremail, installationproviderphone, installationstatus, installer, installeremail, installerphone, installerphotoid, orderid, orderstatus, pincode, state, vehicleregistrationnumber, vehicletype FROM iotplanner WHERE ' || quote_ident($1) || ' = ' || quote_literal($2);

END;

$$ LANGUAGE plpgsql;

SELECT * FROM queryone('state','Karnataka');
```

* BOOMI EXAMPLE: 

```
DROP FUNCTION queryone(varchar, varchar);
CREATE OR REPLACE FUNCTION queryone (varchar, varchar)

RETURNS TABLE ( city text, drivername text, driverphone text, driverphotoid text, earliestinstallation date, enginenumber text, estimateddelivery date, fleetmanager text, fleetmanageremailaddress text, fleetmanagerphone text, gpsterminalnumber text, id int, installationcomments text, installationprovidercontactname text, installationprovideremail text, installationproviderphone text, installationstatus text, installer text, installeremail text, installerphone text, installerphotoid text, orderid text, orderstatus text, pincode text, state text, vehicleregistrationnumber text, vehicletype text ) AS

$$

BEGIN

RETURN QUERY EXECUTE 'SELECT city, drivername, driverphone, driverphotoid, earliestinstallation, enginenumber, estimateddelivery, fleetmanager, fleetmanageremailaddress, fleetmanagerphone, gpsterminalnumber, id, installationcomments, installationprovidercontactname, installationprovideremail, installationproviderphone, installationstatus, installer, installeremail, installerphone, installerphotoid, orderid, orderstatus, pincode, state, vehicleregistrationnumber, vehicletype FROM iotplanner WHERE ' || quote_ident($1) || ' = ' || quote_literal($2);

END;

$$ LANGUAGE plpgsql;

SELECT * FROM queryone(?,?);
```
In Boomi, with the profile, I had defined two parameters and their values were derived from Dynamic Process properties, which in turn were created from XML filter...
