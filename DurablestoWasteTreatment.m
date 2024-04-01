%%reshape durable matrix
durInd=sum(reshape(use_d/10^9.*UseFCBal.*durables.*cap_form_bin,200,48,[]),1);
durInd=sum(reshape(squeeze(durInd),48,164,48),3);

durIndProd=sum(reshape(use_d/10^9.*UseFCBal.*durables.*cap_form_bin,200,48,[]),3);
durable_acc_per_country=sum(durIndProd);
%%all durables data compiled per region:Ind+FD+MV+MVFD
durFD=squeeze(sum(reshape(FD_d(:,4:6:end)/10^9.*UseFCBal.*durables,200,48,48),2));
durMVInd=squeeze(sum(reshape(table2array(MVUse)/10^9.*WasteFC,19,164,[]),2));
durMVFD=squeeze(sum(reshape(table2array(MVFD(:,4:6:end))/10^9.*WasteFC,19,48,[]),3));
sum(sum(durInd))+sum(sum(durFD))+sum(sum(durMVInd))+sum(sum(durMVFD))

WTMbreg=readtable('Waste Treatment.xlsx','Sheet','WTM b country');
WTMbreg=table2array(WTMbreg(2:49,4:8));

%% Compiled by region
durIndW=sum(durInd,2).*WTMbreg;
durIndWProd=sum(durIndProd',2).*WTMbreg;
sum(sum(durIndW))
sum(sum(durIndWProd))

durFD=squeeze(sum(reshape(FD_d(:,4:6:end)/10^9.*UseFCBal.*durables,200,48,48),1));
durFDW=sum(durFD,2).*WTMbreg;
durMVIndW=sum(durMVInd',2).*WTMbreg;
durMVFDW=sum(durMVFD',2).*WTMbreg;

dur=durIndW+durFDW+durMVIndW+durMVFDW;
sum(sum(dur,2))
writematrix(dur,'Waste Treatment.xlsx','Sheet','Total FC in WT by country2');

%% Compiled by Durable Type

durIndProd=sum(reshape(use_d/10^9.*UseFCBal.*durables.*cap_form_bin,200,48,[]),3);
sum(sum(durIndProd))
durFDProd=sum(reshape(FD_d(:,4:6:end)/10^9.*UseFCBal.*durables,200,48,[]),3);
sum(sum(durFDProd))


durMVIndProd=squeeze(sum(reshape(table2array(MVUse)/10^9.*WasteFC,19,164,[]),2));
durMVFDProd=squeeze(sum(reshape(table2array(MVFD(:,4:6:end))/10^9.*WasteFC,19,[],48),2));
sum(sum(durMVIndProd))
sum(sum(durMVFDProd))

durProd=durIndProd+durFDProd;
MVbyProd=durMVIndProd+durMVFDProd;

sum(sum(durProd))+sum(sum(MVbyProd))

writematrix(durProd,'Waste Treatment.xlsx','Sheet','Durable Prod per country2');
writematrix(MVbyProd,'Waste Treatment.xlsx','Sheet','MV per country');