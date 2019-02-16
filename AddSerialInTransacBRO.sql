declare @Serial nvarchar(30)
declare @SerialRecord nvarchar(30)
declare @UID nvarchar(10)

declare SRCur cursor for select SerialNo from ZAddSerialInTransacBRO
  open SRCur
  fetch next from SRCur into @Serial
  while @@FETCH_STATUS=0
  begin
      --exec spAddSerial '000007NP8J', @Serial, null, null, null, null, @SerialRecord output
      select @UID = dbo.ufGetNextSerialRecordUID()
		-- Insert ���������� 1 Record �¡�˹���ҿ�Ŵ��ҧ� ��� Parameter �������
      insert into SerialRecord (UID, Serial1, Serial2, Serial3, Serial4, Serial5, InTransac) 
	  values (@UID, upper(@Serial), NULL, NULL, NULL, NULL, '0000084FM6')--->> ����Ţ Intransac
      
      print @Serial  + @SerialRecord 
  fetch next from SRCur into @Serial
  end
  deallocate SRCur
  
  GO