package developer.remarks.thrift.v1.impl;

import developer.remarks.thrift.v1.enums.PersonState;
import developer.remarks.thrift.v1.exceptions.ProfileException;
import developer.remarks.thrift.v1.models.Profile;
import developer.remarks.thrift.v1.services.ProfileService;
import org.apache.thrift.TException;

import java.time.LocalDateTime;
import java.time.ZoneOffset;

public class ProfileHandler implements ProfileService.Iface {

    @Override
    public Profile getById(long prsId) throws ProfileException, TException {
        if (prsId == 2) {
            long birthTimestamp = LocalDateTime.of(1985, 8, 31, 0, 0, 0)
                    .toEpochSecond(ZoneOffset.UTC);
            return new Profile(prsId, "Александр", "Кузнецов",
                    birthTimestamp, PersonState.GOLD);
        } else {
            throw new ProfileException(-1, "Profile with id = " + prsId + " not found");
        }
    }
}
