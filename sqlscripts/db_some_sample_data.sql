INSERT INTO visitor (visitorName) VALUES ('Andrew');
INSERT INTO visitor (visitorName) VALUES ('Lindsay');
INSERT INTO visitor (visitorName) VALUES ('Taylor');
INSERT INTO visitor (visitorName) VALUES ('Evelyn');

INSERT INTO visitorGroup (visitorGroupName) VALUES ('Group 1');

INSERT INTO visitorGroupMemeber (visitorId, visitorGroupId)
	SELECT visitorId, visitorGroupId FROM visitor
	JOIN visitorGroup
	WHERE visitorName IN ('Andrew','Taylor') AND visitorGroupName IN ('Group 1');

