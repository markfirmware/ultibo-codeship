program CodeshipDemo;
{mode objfpc}{$h+}

uses
 {$ifdef BUILD_MODE_QEMUVPB} QEMUVersatilePB,  {$endif}
 {$ifdef BUILD_MODE_RPI    } BCM2835, BCM2708, {$endif}
 {$ifdef BUILD_MODE_RPI2   } BCM2836, BCM2709, {$endif}
 {$ifdef BUILD_MODE_RPI3   } BCM2837, BCM2710, {$endif}
 GlobalConfig,Threads,Logging,Serial;

procedure StartSerialLogging;
begin
 LOGGING_INCLUDE_COUNTER:=False;
 LOGGING_INCLUDE_TICKCOUNT:=True;
 SERIAL_REGISTER_LOGGING:=True;
 SerialLoggingDeviceAdd(SerialDeviceGetDefault);
 SERIAL_REGISTER_LOGGING:=False;
 LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_SERIAL));
end;

begin
 StartSerialLogging;
 ThreadHalt(0);
end.
