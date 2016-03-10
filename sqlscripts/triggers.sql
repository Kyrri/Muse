delimiter //
create trigger calc_interactionDuration after insert on interaction
for each row
begin 
	if new.interactionTypeId = 6 then 
		delete from visitDuration where visitId=new.visitId;
        insert into visitDuration (
			visitId,
            startTime,
            endTime
        ) values (
			new.visitId,
            (select tstamp from interaction 
				where interactionTypeId=5
				and visitId=new.visitId
                order by tstamp desc 
                limit 1),
			new.tstamp
        );
	elseif new.interactionTypeId = 4 then
		delete from checkInDuration where elementId=new.elementId and visitId=new.visitId;
        insert into checkInDuration (
			visitId,
            elementId,
            startTime,
            endTime
        ) values (
			new.visitId,
            new.elementId,
            (select tstamp from interaction 
				where interactionTypeId=1
				and visitId=new.visitId and elementId=new.elementId
                order by tstamp desc 
                limit 1),
			new.tstamp
        );
    end if;
end;
//
delimiter ;