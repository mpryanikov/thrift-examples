namespace java developer.remarks.thrift.v1.services

include "Exceptions.thrift"
include "Models.thrift"

service ProfileService {

    Models.Profile getById(1: i64 prsId) throws (1: Exceptions.ProfileException e)
}
