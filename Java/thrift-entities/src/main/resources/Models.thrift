namespace java developer.remarks.thrift.v1.models

include "Enums.thrift"

struct Profile {
    1: i64 prsId
    2: string firstName
    3: string lastName
    4: i64 birthDate
    5: Enums.PersonState state
}
