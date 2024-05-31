%% FC Flows - FC-Capital Formation - Emissions - Waste - Stock Addition - Motor Vehicles
%read transfer function table

tx_fnc=readtable("exio_transfer_coeff.xlsx",Sheet='Sheet2');
tx_fnc=tx_fnc(1:200,:);
tx_fnc=table2array(tx_fnc);

%filter vector that filters all materials  embodied in the product of
%the activity (capital formation)
cap_form_bin=repmat(tx_fnc,48,48);
cap_form_bin(cap_form_bin~=0)=2;
cap_form_bin(cap_form_bin==0)=1;
cap_form_bin(cap_form_bin==2)=0;

%filter vector that filters all materials not embodied in the product of
%the activity
embodied=repmat(tx_fnc,48,48);
embodied(embodied~=0)=1;
%% Sectoral Flows - Intermediate and Capital
%create tables that have prods.(200) on rows and activities (164) on columns
%country detail lost due to aggregation
%FC equivalent

%convert matrix from 9600x7872 to 200x164
use_cap=use_reorder.*cap_form_bin.*durables.*UseFCBal;% capital formation for FC-durables
use_cap=squeeze(sum(reshape(use_cap,200,48,[]),2));
sum(sum(use_cap(96,:)))

% convert to 200x26
tot_use=[]
interm_use=[];
cap_acc=[];
for i=1:size(sec_vec,1)
cap_acc=[cap_acc sum(use_cap.*repmat(sec_vec(i,1:164),1,48),2)];
end

final_use=zeros(26,26);
final_cap=zeros(26,26);
final_emb=zeros(26,26);

%convert to 26x26
for i=1:size(sec_vec,1)
    for j=1:size(prod_vec,2)
final_cap(j,i)= sum(sum(cap_acc(:,i).*prod_vec(1:200,j)))/10^9;
    end
end
sum(sum(final_cap))
%% Final Demand, Capital Formation (GFCF) and Change in Inventories
%change_inv=[];
cap_acc=[];
total_use=[];
%create tables that have prods.(200) on rows and activities (164) on columns
%country detail lost due to aggregation
%FC equivalent

sum(sum(total_use))
cap_acc=sum(squeeze(sum(reshape(FD_d(:,4:6:end).*durables.*UseFCBal/10^9,200,48,[]),2)),2);
sum(sum(cap_acc))

tot_use=[]
cap_use=[];
for i=1:size(prod_vec,2)
tot_use=[tot_use sum(sum(total_use(:,1:3),2).*prod_vec(1:200,i).*UseFCBal(1:200),2)];
cap_use=[cap_use sum(cap_acc.*prod_vec(1:200,i),2)];
end

fd_use=zeros(26,26);
fd_cap=zeros(26,26);

for i=1:size(sec_vec,1)
    for j=1:size(prod_vec,2)
fd_use(j,i)= sum(sum(tot_use(:,i).*prod_vec(1:200,j)))/10^9;
fd_cap(j,i)= sum(sum(cap_use(:,i).*prod_vec(1:200,j)))/10^9;
    end
end

fd_use=sum(fd_use,2);
fd_cap=sum(fd_cap,2);

