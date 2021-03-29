# SELECT iotSensorsSerialNumber, truckRegistrationNumber, customerId, customerName, customerAddress, customerContractId, customerContractEndDate
# FROM customer_trucks
# JOIN customer_details
# ON customer_details.customerId = customer_trucks.customerIdTruck
# JOIN iot_sensors
# ON iot_sensors.truckRegistrationNumberIotSensors = customer_trucks.truckRegistrationNumber
# WHERE iot_sensors.IotSensorsSerialNumber = 'abc-10011-1-1'
