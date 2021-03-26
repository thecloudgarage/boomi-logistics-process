SELECT iotSensorsSerialNumber, truckRegistrationNumber, customerId, customerName, customerAddress, customerContractId, customerContractEndDate
FROM iot_sensors
INNER JOIN customer_details
INNER JOIN customer_trucks
ON customer_trucks.customerIdTruck = customer_details.customerId
AND iot_sensors.IotSensorsSerialNumber = 'abc-10011-1-1'
