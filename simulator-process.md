## Objective
Build a process on top of Boomi integration that can serve as a simulator and testing tool for various purposes (mqtt/database/kafka/http, etc.)

## Project inspiration
The inspiration for this project came due to a need for IOT testing tool, which can feature as a MQTT publisher. The nature of testing involves generating incremental lat/long/temperature data and publishing it to a MQTT broker.
With this pursuit, I ended up paho and experimenting with mqtt cli tools. However, the level of complexity in building an automated data set and then automating the publishing was too high.

## Boomi to the rescue
Boomi Integration service provides a rich featurette of connectors and integration logic inclusive of custom scripting, etc. I decided to take advantage of Boomi Integration to build a simulation tool instead of leveraging docker/linux/windows tools.
This helped me further as my target processes that need to be tested via simulation were deployed on Boomi itself

## Cut the chase



![image](https://user-images.githubusercontent.com/39495790/120113088-837a0800-c196-11eb-88f2-14f29a82d7b1.png)




## The magic of GROOVY!!!

```
import java.util.Properties;
import java.text.DateFormat;
import java.util.GregorianCalendar;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat
import java.io.InputStream;
// Specify the length of time to wait in seconds.

// Leave the rest of the script as-is to pass the Documents to the next step.
int intValue = 5;
for ( int i = 0; i <= intValue; i++) {
Thread.sleep(5000);
Calendar cal = Calendar.getInstance();
DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd HHmmss.SSS");
datetimeoutput = dateFormat.format(cal.getTime());
latitudeoutput = latitudeinput + 1;
longitudeoutput = longitudeinput + 1;
temperatureoutput = temperatureinput + 1;
}
```
