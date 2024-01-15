%Energy Secs
%% Agriculture, Forestry and Fishing
secs_act=1:19;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
AFF_act=repmat(temp_act,1,48);

secs_prod=1:19;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
AFF_prod=repmat(temp_prod',48,1);

%% Mining and Quarrying
% Mining of Fossil Carbon Carriers
%Coal Mining activity and related products
secs_act=20;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Coal_act=repmat(temp_act,1,48);

secs_prod=20:27;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Coal_prod=repmat(temp_prod',48,1);
%Crude Oil Extraction activity and related products
secs_act=21;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
oil_act=repmat(temp_act,1,48);

secs_prod=28;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
oil_prod=repmat(temp_prod',48,1);
%Natural Gas and LNG activity and related products
secs_act=22;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
NG_act=repmat(temp_act,1,48);

secs_prod=29:30;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
NG_prod=repmat(temp_prod',48,1);
% Mining and extraction of other materials
secs_act=23:34;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Mining_other_act=repmat(temp_act,1,48);

secs_prod=32:42;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Mining_other_prod=repmat(temp_prod',48,1);
%% Manufacturing
%%Manufacture of Coke Products
secs_act=56;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Coke_act=repmat(temp_act,1,48);

secs_prod=64:66;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Coke_prod=repmat(temp_prod',48,1);
%%Manufacture of Refined Petroleum Products
secs_act=57;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
PR_act=repmat(temp_act,1,48);

secs_prod=67:84;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
PR_prod=repmat(temp_prod',48,1);
%%Manufacture of Chemicals
secs_act=61:63;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Chem_act=repmat(temp_act,1,48);

secs_prod=88:95;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Chem_prod=repmat(temp_prod',48,1);
%%Manufacture of Basic Plastics
secs_act=59;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Bplas_act=repmat(temp_act,1,48);

secs_prod=86;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Bplas_prod=repmat(temp_prod',48,1);
%%Manufacture of Rubber and Plastic Products
secs_act=64;
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Rubplas_act=repmat(temp_act,1,48);

secs_prod=96;
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Rubplas_prod=repmat(temp_prod',48,1);
%%Manufacture of Heterogeneous Machinery
secs_act=[86:90,93];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
HM_act=repmat(temp_act,1,48);

secs_prod=[118:122,125];
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
HM_prod=repmat(temp_prod',48,1);
%%Manufacture of  Transport Vehicles
secs_act=[91,92];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Veh_act=repmat(temp_act,1,48);

secs_act=[91,92];
temp_act=zeros(1,200);
temp_act(secs_act)=1;
Veh_pr=repmat(temp_act,1,48);
%%Manufacture of Paper Products, Printing of Media, Wood Products (Paper,
%%Meida, Wood)
secs_act=[50,52,54,55];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
PMW_act=repmat(temp_act,1,48);

secs_prod=[58,60,62,63];
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
PMW_prod=repmat(temp_prod',48,1);

%%Manufacture of Textiles, Leather, and related products
secs_act=[47:49];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Tex_act=repmat(temp_act,1,48);

secs_prod=[55:57];
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Tex_prod=repmat(temp_prod',48,1);
%%Manufacture of Basic and Fabricated Metals
secs_act=[72,74,76,78,80,82,84,85];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Met_act=repmat(temp_act,1,48);

secs_prod=[104,106,108,110,112,114,116,117];
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Met_prod=repmat(temp_prod',48,1);
%%Manufacture of Other Products
secs_act=[35:46,58,65,67,68,69,71];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Manuf_other_act=repmat(temp_act,1,48);

secs_prod=[43:54,85,97,99,100,101,103];
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Manuf_other_prod=repmat(temp_prod',48,1);

%% Services
%%Electricity and Water 
secs_act=[58,96:109,112,113];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
EW_act=repmat(temp_act,1,48);

secs_act=[85,128,129,130,131,132,133,134,135,136,137,138,139,140,141,147,148,149];
temp_act=zeros(1,200);
temp_act(secs_act)=1;
EW_pr=repmat(temp_act,1,48);

%secs_prod=[85,128:149];
%temp_prod=zeros(1,200);
%temp_prod(secs_prod)=1;
%EW_prod=repmat(temp_prod',48,1);
%%Gas 
secs_act=[110,111];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
gas_act=repmat(temp_act,1,48);

secs_prod=[142,143,144,145,146];
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
gas_prod=repmat(temp_prod',48,1);
%%Construction
secs_act=[114];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
construction_act=repmat(temp_act,1,48);

%%Transport, Storage, Communiciation Services
secs_act=[121:128];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
trans_comm_act=repmat(temp_act,1,48);

secs_act=[157,158,159,160,161,162,163,164];
temp_act=zeros(1,200);
temp_act(secs_act)=1;
trans_comm_PR=repmat(temp_act,1,48);
%%Financial and Business Services, Real Estate and Renting, Wholesale and
%%retail trade, Hotels and Restaurants (Financial and Business Services)
secs_act=[116:120,129:136];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
fin_bus_act=repmat(temp_act,1,48);

secs_act=[152:155,165:172];
temp_act=zeros(1,200);
temp_act(secs_act)=1;
fin_bus_pr=repmat(temp_act,1,48);
%%Public Services
secs_act=[137:139,160:162];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
pub_serv_act=repmat(temp_act,1,48);

secs_act=[173:175,196:198];
temp_act=zeros(1,200);
temp_act(secs_act)=1;
pub_serv_pr=repmat(temp_act,1,48);
%%Private Households as employers 
secs_act=[163];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
PHH_act=repmat(temp_act,1,48);

secs_prod=[199];
temp_prod=zeros(1,200);
temp_prod(secs_act)=1;
PHH_prod=repmat(temp_prod',48,1);
%%Extra-Territorial Organizations
secs_act=[164];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
ETO_act=repmat(temp_act,1,48);

%% Recycling
%%Recycling Raw Materials
secs_act=[51,53,60,66,70,73,75,77,79,81,83,94,95,115];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Rec_act=repmat(temp_act,1,48);

secs_prod=[59,61,87,98,102,105,107,109,111,113,115,127];
temp_prod=zeros(1,200);
temp_prod(secs_prod)=1;
Rec_prod=repmat(temp_prod',48,1);

%% Waste Treatment Activities
secs_act=[140:159];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Waste_act=repmat(temp_act,1,48);

%% Manufacturing
secs_act=[35:50,52,54,55,56,57,59,61,62,63,64,65,67:69,71,72,74,76,78,80,82,84:93];
temp_act=zeros(1,164);
temp_act(secs_act)=1;
Manuf_act=repmat(temp_act,1,48);
%% Manufacturing
FDsec=[1,2,3];
temp_act=zeros(1,6);
temp_act(FDsec)=1;
FDsecs=repmat(temp_act,1,48);
%% Sectors Vector
sec_vec=[AFF_act; Coal_act; oil_act; NG_act; Mining_other_act; Coke_act; PR_act; Chem_act;Bplas_act;Rubplas_act;HM_act;Veh_act;PMW_act;Tex_act;Met_act; Manuf_other_act;gas_act;EW_act;construction_act;trans_comm_act;fin_bus_act;pub_serv_act;PHH_act;ETO_act;Rec_act;Waste_act];
%% Products Vector
prod_vec=[AFF_prod, Coal_prod, oil_prod, NG_prod, Mining_other_prod, Coke_prod,PR_prod, Chem_prod,Bplas_prod,Rubplas_prod,HM_prod,zeros(9600,1),PMW_prod,Tex_prod,Met_prod, Manuf_other_prod,gas_prod,zeros(9600,1),zeros(9600,1),zeros(9600,1),zeros(9600,1),zeros(9600,1),zeros(9600,1),zeros(9600,1),Rec_prod,zeros(9600,1)];
%% Durable Products
durable_secs=[18,40:42,55:58,62,63,81,96,97,99:104,106,108,110,112,114,116:122,125];%Motor Veh. missing
durables=zeros(1,200);
durables(durable_secs)=1;
durables=repmat(durables,1,48)';
%Durables Waste FC
%durablesWaste=[
%% Intermediate vs Final Goods Shares
%final_shares_dur=[.59,.72,.08,.23,x,]
%%
CC=readtable('Carbon Content.xls','Sheet','SUT_Products_C_Range','PreserveVariableNames',true);
UseFCBal=repmat(table2array(CC(:,4)),48,1);
WasteFrac=readtable('Carbon Content.xls','Sheet','WasteFractions','PreserveVariableNames',true);
WasteFC=[table2array(WasteFrac(1:19,4))];
Emis=readtable('Carbon Content.xls','Sheet','Emissions','PreserveVariableNames',true);
CCIOT=readtable('Carbon Content.xls','Sheet','IOT_Products','PreserveVariableNames',true);
CCIOT=repmat(table2array(CCIOT(:,7)),48,1);


%% Coke Oven Products Supply And Use
use=readtable('MR_HUSE_2011_v3_3_18_13.csv','PreserveVariableNames',true);
use(1:2,:)=[];
use(1:1000,1:1000);
str=string(table2array(use(:,1)))+ " "+string(table2array(use(:,2)));
use.Properties.RowNames=str;
use(:,1:5)=[];
use_d=table2array(use);%read and arrange USE data
sum(sum(use_d))

sup=readtable('MR_HSUP_2011_v3_3_18_13.csv','PreserveVariableNames',true);
sup(1:2,:)=[];
sup(1:1000,1:1000);
sup.Properties.RowNames=str;
sup(:,1:5)=[];
sup_d=table2array(sup);%read and arrange USE data
sum(sum(sup_d))

%% Final Demand

FD=readtable('MR_HSUTs_2011_v3_3_18_13_FD.csv','PreserveVariableNames',true);
FD.Properties.RowNames=string(table2array(FD(:,1))) + " " + string(table2array(FD(:,2)));
FD(:,1:5)=[];
FD_d=table2array(FD);
%FD(:,6:6:end)=[];
%FD(:,5:5:end)=[];
%FD(:,4:4:end)=[];

%% Emissions
Emission=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','Emiss_act','PreserveVariableNames',true);
Emission=Emission(:,4:end);
Emission_d=table2array(Emission);

EmisFD=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','Emiss_FD','PreserveVariableNames',true);
EmisFD.Properties.RowNames=string(table2array(EmisFD(:,1))) + " " + string(table2array(EmisFD(:,3)));
EmisFD(:,1:3)=[];
EmisFD(:,6:6:end)=[];
EmisFD(:,5:6:end)=[];
EmisFD(:,4:6:end)=[];
EmisFD=table2array(EmisFD).*table2array(Emis(:,5));
sum(sum(EmisFD))



%% Waste Sup
WasteSup=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','waste_sup_act','PreserveVariableNames',true);%Final Demand Waste Supply
WasteSup=WasteSup(:,3:end);
WasteSup_d=table2array(WasteSup);
WasteFC=table2array(WasteFrac(1:19,4));
%WasteFC(15)=0;
%WasteFC(15)=0.1;
%WasteFC(15)=0.2;
%WasteFC(15)=0.3;
%WasteFC(15)=0.4;

%Litter
WasteLit=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','Unreg_w_act','PreserveVariableNames',true);%unregistered waste
WasteLit=WasteLit(:,3:end);
WasteLit_d=squeeze(sum(reshape(table2array(WasteLit.*WasteFC)/10^9,19,164,48),3));
sum(sum(WasteLit_d.*Waste_act(1:164)))

sum(sum(WasteLit_d(:,[110,111])))


WasteSupFD=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','waste_sup_FD','PreserveVariableNames',true);%Final Demand Waste Supply
WasteSupFD.Properties.RowNames=string(table2array(WasteSupFD(:,1)));
WasteSupFD(:,1:2)=[];
WasteSupFD(:,6:6:end)=[];
WasteSupFD(:,5:6:end)=[];
WasteSupFD(:,4:6:end)=[];
sum(sum(table2array(WasteSupFD)))
WasteSupFDFC=table2array(WasteSupFD).*WasteFC;
sum(sum(WasteSupFDFC))

%% Waste Use

WasteUse=WasteUse(:,3:end);
WasteUse_d=table2array(WasteUse);
WasteUseFC=use_d;UseFCBal;.*wvectorIOT;.*wvectorIOT;servsecs;ReUsesecs;energysecs;;mvector;
WasteUseFC=WasteUsed.*wvectorIOT;table2array(WasteFrac(:,3));.*wvectorIOT;;.*mvector;servsecs;ReUsesecs;energysecs;;mvector;
sum(sum(WasteUseFC))

%% Stocks 2 Waste
StockstoWaste=readtable('MR_HSUTs_2011_v3_3_18_13_stock_to_waste.csv');

% Input string array
str = string(table2array(StockstoWaste(:,53)));

% Define the regular expression pattern to match numbers
pattern = '\d+\.\d+|\d+';

% Use the regexp function to find all matches
matches = regexp(str, pattern, 'match');
% Iterate through the matches and convert them to numbers
numbers = cellfun(@cell2mat, matches, 'UniformOutput', false);
numbers=str2double(numbers);

StockstoWaste(:,53)=[];
StockstoWaste=[StockstoWaste, table(numbers)];

StockstoWaste=table2array(StockstoWaste(:,6:end));
S2WFC=sum(StockstoWaste,2).*UseFCBal;%ReUsesecs';CCIOT;
S2WFC=squeeze(sum(reshape(S2WFC,200,48,[]),2));
sum(sum(S2WFC))
StockstoWaste(59,1)

%% Stock Addition
StockAdd=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','stock_addition_act','PreserveVariableNames',true);
StockAdd=StockAdd(:,3:end);
SA=table2array(StockAdd);%.*table2array(WasteFrac(:,3));

%Final Demand Stock Addition
SAFD=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','stock_addition_fd','PreserveVariableNames',true);
SAFD.Properties.RowNames=string(table2array(SAFD(:,1)));
SAFD(:,1:2)=[];
SAFD_d=table2array(SAFD);

SAFD(:,6:6:end)=[];
SAFD(:,5:5:end)=[];
SAFD(:,4:4:end)=[];

%% Motor Vehicles
MVSup=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','mach_sup_waste_act','PreserveVariableNames',true);
MVUse=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','mach_use_waste_act','PreserveVariableNames',true);
MVFD=readtable('MR_HSUTs_2011_v3_3_18_13_extensions.xlsx','Sheet','mach_use_waste_fd','PreserveVariableNames',true);
MVUse(:,1:2)=[];
MVFD(:,1:2)=[];
MVFD(:,6:6:end)=[];
MVFD(:,5:5:end)=[];
MVFD(:,4:4:end)=[];

MVFDFC=sum(table2array(MVFD).*WasteFC);
sum(MVFDFC)

MVUse=table2array(MVUse);
MVUseFC=sum(sum(MVUse.*WasteFC));
sum(MVUseFC)

sum(table2array(MVUse).*WasteFC,2)+sum(sum(table2array(MVFD).*WasteFC,2))
%% Material Discharge for Products supplied to Non-energy Sectors
% Lifetime Function
LifeTime=readtable('Lifetime_funct_all_exiobase.xlsx','Sheet','lifetime_funct','PreserveVariableNames',true);
LifeTime.Properties.RowNames=string(table2array(LifeTime(:,1)));
LifeTime(:,1:3)=[];
LT=repmat(table2array(LifeTime),48,1);
PMB=repmat(table2array(CC(1:200,6)),48,1);
PMB_Lifetime=zeros(9600,99);
sup_d=sum(TotFC.*mvector,2).*PMB;
for i=1:9600
    for j=1:99
        PMB_Lifetime(i,j)=LT(i,j)*PMB(i)*sup_d(i);
    end
end

sum(sum(PMB_Lifetime))
writematrix(PMB_Lifetime, 'Material_Discharge.xlsx')
PMB_Lifetime_FC=PMB_Lifetime.*UseFCBal;
sum(PMB_Lifetime_FC)
writematrix(PMB_Lifetime_FC, 'Material_Discharge.xlsx','Sheet','Fossil Carbon Discharge')
writematrix(sum(PMB_Lifetime_FC), 'Material_Discharge.xlsx','Sheet','FC Discharge Years')
writematrix(sum(PMB_Lifetime_FC), 'Material_Discharge.xlsx','Sheet','FC Discharge Years Mvector')

FC_discharge=sum(PMB_Lifetime_FC);

