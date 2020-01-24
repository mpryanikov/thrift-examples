package developer.remarks;

import developer.remarks.thrift.v1.models.Profile;
import developer.remarks.thrift.v1.services.ProfileService;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class ThriftClient {

    public static void main(String[] args) {
        try {
            TTransport transport = new TSocket("localhost", 9090);
            transport.open();

            TProtocol protocol = new TBinaryProtocol(transport);
            ProfileService.Client client = new ProfileService.Client(protocol);

            perform(client);

            transport.close();
        } catch (TException x) {
            x.printStackTrace();
        }
    }

    private static void perform(ProfileService.Client client) throws TException {
        Profile profile = client.getById(2L);

        Instant instant = Instant.ofEpochSecond(profile.getBirthDate());
        LocalDateTime birthDate = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());

        System.out.println(
                String.format("%s родился %s. Статус: %s.",
                        profile.getFirstName(),
                        DateTimeFormatter.ISO_DATE.format(birthDate),
                        profile.getState())
        );
    }
}
