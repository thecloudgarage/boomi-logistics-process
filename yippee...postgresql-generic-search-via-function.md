Here we are calling the queryone function with two variables... the first variable $1 is implemented in a quote_ident to identify the column name and the second variable $2 is implemented via a quote_literal to insert the value

CHECKED through ssh/psql and adminer interface ... works :):) ... took 3 days!!!!!
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
