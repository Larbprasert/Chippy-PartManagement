CREATE FUNCTION GetParamDesc
(	 
	 @p_code varchar(50),
	 @p_type varchar(50),
	 @P_Lang varchar(50)
)
RETURNS varchar(200)
as
begin
 declare @result varchar(200) 
set @result=
(
	-- Add the SELECT statement with parameter references here
		Select (Case When 'TH' = @P_Lang Then Desc_Th Else Desc_En End) As Txt
		FROM  sys_param  WHERE  PARAM_TYPE = @p_type AND PARAM_CODE = @p_code
)

RETURN @result
end