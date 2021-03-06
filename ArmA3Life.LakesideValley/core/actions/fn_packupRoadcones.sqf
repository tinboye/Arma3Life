/*
	File: fn_packupRoadcones.sqf
	Author: sc
	
	Description:
	Packs up the nearest Roadcone or Roadcone strip.
*/
private["_roadcones","_roadconesobjects"];
	_roadcones = nearestObjects[getPos player,["RoadCone_L_F"],2] select 0;
if(isNil "_roadcones") then {
	_roadcones = nearestObjects[getPos player,["RoadCone_F"],2] select 0;
};
if(isNil "_roadcones") exitWith {};
if(!isnil {_roadcones getVariable "roadcone"}) then
{	
	switch(true) do
	{
	case ((typeOf _roadcones) == "RoadCone_L_F"): {
	_roadconesobjects = _roadcones getVariable "roadcone";
	if (count _roadconesobjects > 1) then {
	if(([true,"RoadConeStripB",1] call life_fnc_handleInv)) then
	{
	titleText["You have packed up a strip of blinking road cones.","PLAIN"];
	{deleteVehicle _x} foreach _roadconesobjects;
	};
	};
	if (count _roadconesobjects <= 1) then {
	if(([true,"RoadConeB",1] call life_fnc_handleInv)) then
	{
	titleText["You have packed up a blinking road cone.","PLAIN"];
	{deleteVehicle _x} foreach _roadconesobjects;
	};
	};
};
	case ((typeOf _roadcones) == "RoadCone_F") : {
	_roadconesobjects = _roadcones getVariable "roadcone";
	if (count _roadconesobjects > 1) then {
	if(([true,"RoadConeStrip",1] call life_fnc_handleInv)) then
	{
	titleText["You have packed up a strip of road cones.","PLAIN"];
	{deleteVehicle _x} foreach _roadconesobjects;
	};
	};
	if (count _roadconesobjects <= 1) then {
	if(([true,"RoadCone",1] call life_fnc_handleInv)) then
	{
	titleText["You have packed up a road cone.","PLAIN"];
	{deleteVehicle _x} foreach _roadconesobjects;
	};
	};
};
	default {nil};
	};
};