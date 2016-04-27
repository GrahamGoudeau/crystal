require "../sys/socket"
require "../stdint"

lib LibC
  IPPROTO_IP           =   0
  IPPROTO_IPV6         =  41
  IPPROTO_ICMP         =   1
  IPPROTO_RAW          = 255
  IPPROTO_TCP          =   6
  IPPROTO_UDP          =  17
  INADDR_ANY           = InAddrT.new(0x00000000)
  INADDR_BROADCAST     = InAddrT.new(0xffffffff)
  INADDR_NONE          = InAddrT.new(0xffffffff)
  INADDR_LOOPBACK      = InAddrT.new(0x7f000001)
  INET_ADDRSTRLEN      = 16
  INET6_ADDRSTRLEN     = 46
  IPV6_JOIN_GROUP      = 20
  IPV6_LEAVE_GROUP     = 21
  IPV6_MULTICAST_HOPS  = 18
  IPV6_MULTICAST_IF    = 17
  IPV6_MULTICAST_LOOP  = 19
  IPV6_UNICAST_HOPS    = 16
  IPV6_V6ONLY          = 26
  IPV6_ADD_MEMBERSHIP  = LibC::IPV6_JOIN_GROUP
  IPV6_DROP_MEMBERSHIP = LibC::IPV6_LEAVE_GROUP

  alias InPortT = UInt16T
  alias InAddrT = UInt32T

  struct InAddr
    s_addr : InAddrT
  end

  union In6AddrIn6Union
    __s6_addr : StaticArray(UInt8T, 16)
    __s6_addr16 : StaticArray(UInt16T, 8)
    __s6_addr32 : StaticArray(UInt32T, 4)
  end

  struct In6Addr
    __in6_union : In6AddrIn6Union
  end

  struct SockaddrIn
    sin_family : SaFamilyT
    sin_port : InPortT
    sin_addr : InAddr
    sin_zero : StaticArray(UInt8T, 8)
  end

  struct SockaddrIn6
    sin6_family : SaFamilyT
    sin6_port : InPortT
    sin6_flowinfo : UInt32T
    sin6_addr : In6Addr
    sin6_scope_id : UInt32T
  end
end
