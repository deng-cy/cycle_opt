function out = model
%
% calendar_aging_final.m
%
% Model exported on May 15 2022, 01:41 by COMSOL 5.5.0.359.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('./');

model.label('calendar_aging_final.mph');

model.param.group.create('par2');
model.param('par2').set('k_sol', '0');
model.param('par2').set('k_SEI', '1.77310693029508e-12[m/s]');
model.param('par2').set('k_diss_Kindermann', '4.37668464308884E-6');
model.param('par2').set('Ea_diss_Kindermann', '62907.6650590933 [J/mol]');
model.param.set('A_cell', '0.7[m^2]', 'Cell cross section area');
model.param.set('alpha_a_neg', '0.6', 'Reaction rate coefficient Negative');
model.param.set('alpha_a_pos', '1-alpha_a_neg', 'Reaction rate coefficient Positive');
model.param.set('alpha_c_H2', '0.5', 'cathodic charge transfer coefficient for H2 generation');
model.param.set('alpha_c_neg', '0.6', 'Reaction rate coefficient Negative');
model.param.set('alpha_c_pos', '1-alpha_c_neg', 'Reaction rate coefficient Positive');
model.param.set('alpha_c_SEI', '0.5', 'cathodic charge transfer coefficient for SEI formation');
model.param.set('c_e0', '1[mol/L]', 'Initial electrolyte salt concentration');
model.param.set('c_EC0', '4541[mol/m^3]', 'solvent concentration');
model.param.set('c_s_max_neg', '31507[mol/m^3]', 'Max solid phase concentration Negative');
model.param.set('c_s_max_pos', '49000[mol/m^3]', 'Max solid phase concentration Positive');
model.param.set('c_s0_neg', 'c_s_max_neg*soc0_neg', 'Initial solid phase conc Negative');
model.param.set('c_s0_pos', 'c_s_max_pos*soc0_pos', 'Initial solid phase conc Positove');
model.param.set('c_SEI0', '0[mol/m^3]');
model.param.set('D_s_neg', '1.44e-10[cm^2/s]', 'Solid phase Li-diffusivity Negative');
model.param.set('D_s_pos', '5E-13[m^2/s]', 'Solid phase Li-diffusivity Positive');
model.param.set('Dis_1C', 'Q0*A_cell/3600[s]', '1C discharge current');
model.param.set('dlnf_dlnc', '0', 'Activity factor concentration variation');
model.param.set('E_max', '4.25[V]');
model.param.set('E_min', '3[V]');
model.param.set('Ea_kf', '20[kJ/mol]', 'Activation energy of cathode film reaction const');
model.param.set('Ea_kLi', '50[kJ/mol]', 'Activation energy of negative electrode reaction const');
model.param.set('Ea_kneg', '45[kJ/mol]', 'Activation energy of negative electrode reaction const');
model.param.set('Ea_kpos', '45[kJ/mol]', 'Activation energy of negative electrode reaction const');
model.param.set('Ea_SEI', '93995.1681264628 [J/mol]', 'Activation energy of negative electrode reaction const');
model.param.set('epsilon_e_neg0', '0.3', 'Electrolyte phase vol-fraction Negative');
model.param.set('epsilon_e_pos0', '0.3', 'Electrolyte phase vol-fraction Positive');
model.param.set('epsilon_e_sep', '0.45', 'Separator porosity');
model.param.set('epsilon_f_neg', '0.023869006+0.020932337', 'Polymer and conductive filler volume fraction Negative');
model.param.set('epsilon_f_pos', '0.124894181+0.111303239', 'Polymer and conductive filler volume fraction Positive');
model.param.set('epsilon_s_neg0', '0.6', 'Solid phase vol-fraction Negative');
model.param.set('k0_neg', '3.5E-11', 'Reaction rate coefficient Negative');
model.param.set('k0_pos', '1E-11', 'Reaction rate coefficient Positive');
model.param.set('kappa_s_neg', '81.9[S/m]', 'Solid phase conductivity Negative');
model.param.set('kappa_s_pos', '100[S/m]', 'Solid phase conductivity Positive');
model.param.set('L_neg', '220[um]', 'Length of negative electrode');
model.param.set('L_pos', '150[um]', 'Length of positive electrode');
model.param.set('L_sep', '30[um]', 'Length of separator');
model.param.set('M_SEI', '0.162[kg/mol]', 'molecular weight of SEI');
model.param.set('pBrug', '1.5', 'Bruggeman coefficient');
model.param.set('pBrug_s', '1.5', 'Solid phase Bruggemann coefficient');
model.param.set('Q0', 'min(Q0_pos, Q0_neg)');
model.param.set('Q0_neg', 'A_cell*c_s_max_neg*(theta100_neg-theta0_neg)*epsilon_s_neg0*L_neg*F_const');
model.param.set('Q0_pos', 'A_cell*c_s_max_pos*(theta0_pos-theta100_pos)*epsilon_s_pos0*L_pos*F_const');
model.param.set('r_p_neg', '10.8[um]', 'Particle radius Negative');
model.param.set('r_p_pos', '5[um]', 'Particle radius Positive');
model.param.set('rho_SEI', '1690[kg/m^3]', 'SEI density');
model.param.set('SOC', '0.5', 'Initial SOC');
model.param.set('soc0_neg', '(SOC)*(theta100_neg- theta0_neg) + theta0_neg', 'Initial Negative State of Charge');
model.param.set('soc0_pos', '(1-SOC)*(theta0_pos-theta100_pos) + theta100_pos', 'Initial Positive State of Charge');
model.param.set('T', '60+273.15[K]', 'Temperature');
model.param.set('t_plus0', '0.38', 'Cationic transport number');
model.param.set('T_ref', '273.15+25[K]', 'Reference Temperature');
model.param.set('theta0_neg', '0');
model.param.set('theta0_pos', '0.975');
model.param.set('theta100_neg', '0.5');
model.param.set('theta100_pos', '0');
model.param.set('delta_neg', '0 [m]');
model.param.set('delta_pos', '0 [m]');
model.param.set('a_s_pos0', '3*epsilon_s_pos0/r_p_pos', '3*epsilon_s_pos0/r_p_pos');
model.param.set('D_EC', '2E-18[m^2/s]');
model.param.set('rho_Li', '534[kg/m^3]');
model.param.set('M_Li', '6.94e-3 [kg/mol]');
model.param.set('d_cell', '1 [cm]', 'Coin cell diameter');
model.param.set('delta_SEI0', '10[nm]');
model.param.set('lambda_SEI0', '200298.440296865[1/m]');
model.param.set('t_rest', '1[s]');
model.param.set('C_rate', '1/3');
model.param.set('rel_tol', '1E-4');
model.param.set('soc_neg_storage', '(SOC_storage)*(theta100_neg- theta0_neg) + theta0_neg');
model.param.set('soc_pos_storage', '(1-SOC_storage)*(theta0_pos-theta100_pos) + theta100_pos');
model.param.set('SOC_storage', '0.98');
model.param.set('CUT_OFF_CURRENT', 'Q0/3600[s]/20');
model.param.set('lambda_H2', '2e5[1/m]');
model.param.set('t_end', '100[d]');
model.param.set('D_H2O', '3e-11[m^2/s]');
model.param.set('D_Hplus', '10e-11[m^2/s]');
model.param.set('D_Mn', '5e-11[m^2/s]');
model.param.set('epsilon_s_pos0', '0.5');
model.param.set('a_s_neg0', '3*epsilon_s_neg0/r_p_neg', '3*epsilon_s_pos0/r_p_pos');
model.param.set('V_p_neg', '4/3*pi*r_p_neg^3');
model.param.set('E_SOC_10', '3.395[V]');
model.param.set('E_SOC_20', '3.479[V]');
model.param.set('E_SOC_30', '3.538[V]');
model.param.set('E_SOC_70', '3.916[V]');
model.param.set('E_SOC_80', '4.023[V]');
model.param.set('E_SOC_90', '4.146[V]');
model.param.set('t_storage', '30[d]');
model.param.set('factor_Hplus', '4');
model.param.set('Ea_sol', '50 [kJ/mol]');
model.param.set('t_charge', 'SOC_storage*C_ocv/I_app', 'Time to charge until target SOC');
model.param.set('C_ocv', '1.540472e+05 [C]');
model.param.set('I_app', 'Q0/3600[s]*C_rate');
model.param('par2').label('Side Reaction Selection');
model.param.label('Parameters');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 1);

model.component('comp1').curvedInterior(false);

model.result.table.create('tbl1', 'Table');

model.func.create('int1', 'Interpolation');
model.func.create('int2', 'Interpolation');
model.func.create('an1', 'Analytic');
model.func.create('an2', 'Analytic');
model.func.create('int3', 'Interpolation');
model.func.create('int5', 'Interpolation');
model.func.create('int6', 'Interpolation');
model.func('int1').label('U_pos');
model.func('int1').set('funcname', 'U_pos');
model.func('int1').set('table', {'0' '4.44';  ...
'0.032' '4.34';  ...
'0.102' '4.23';  ...
'0.187' '4.13';  ...
'0.289' '4.025';  ...
'0.38' '3.945';  ...
'0.543' '3.835';  ...
'0.775' '3.71';  ...
'0.872' '3.62';  ...
'0.925' '3.51';  ...
'0.943' '3.42';  ...
'0.957' '3.30';  ...
'0.966' '3.165';  ...
'0.970' '3.02';  ...
'0.972' '2.90';  ...
'0.975' '2.688'});
model.func('int1').set('interp', 'piecewisecubic');
model.func('int1').set('extrap', 'linear');
model.func('int2').label('U_neg');
model.func('int2').set('funcname', 'U_neg');
model.func('int2').set('table', {'0' '2.781186612';  ...
'0.01' '1.520893224';  ...
'0.02' '0.893922607';  ...
'0.03' '0.581284406';  ...
'0.04' '0.42452844';  ...
'0.05' '0.344895805';  ...
'0.06' '0.303146342';  ...
'0.07' '0.279578072';  ...
'0.08' '0.264093089';  ...
'0.09' '0.251347845';  ...
'0.1' '0.238588379';  ...
'0.11' '0.224803164';  ...
'0.12' '0.210294358';  ...
'0.13' '0.196408586';  ...
'0.14' '0.184624188';  ...
'0.15' '0.175188157';  ...
'0.16' '0.167373311';  ...
'0.17' '0.160452107';  ...
'0.18' '0.154025412';  ...
'0.19' '0.147948522';  ...
'0.2' '0.142214997';  ...
'0.21' '0.13688271';  ...
'0.22' '0.132033114';  ...
'0.23' '0.127747573';  ...
'0.24' '0.124091616';  ...
'0.25' '0.121103387';  ...
'0.26' '0.11878567';  ...
'0.27' '0.117102317';  ...
'0.28' '0.115980205';  ...
'0.29' '0.115317054';  ...
'0.3' '0.114993965';  ...
'0.31' '0.114890105';  ...
'0.32' '0.114896278';  ...
'0.33' '0.114924619';  ...
'0.34' '0.114913068';  ...
'0.35' '0.114824904';  ...
'0.36' '0.114644725';  ...
'0.37' '0.114372614';  ...
'0.38' '0.114017954';  ...
'0.39' '0.11359371';  ...
'0.4' '0.11311133';  ...
'0.41' '0.112575849';  ...
'0.42' '0.111980245';  ...
'0.43' '0.111297682';  ...
'0.44' '0.110470149';  ...
'0.45' '0.109393081';  ...
'0.46' '0.107900592';  ...
'0.47' '0.10576964';  ...
'0.48' '0.102783317';  ...
'0.49' '0.09889031';  ...
'0.5' '0.094391564';  ...
'0.51' '0.089921069';  ...
'0.52' '0.086112415';  ...
'0.53' '0.083265315';  ...
'0.54' '0.081326247';  ...
'0.55' '0.080074892';  ...
'0.56' '0.07928329';  ...
'0.57' '0.078778765';  ...
'0.58' '0.078447703';  ...
'0.59' '0.078220432';  ...
'0.6' '0.078055641';  ...
'0.61' '0.077929111';  ...
'0.62' '0.077826563';  ...
'0.63' '0.077739397';  ...
'0.64' '0.077662227';  ...
'0.65' '0.077591472';  ...
'0.66' '0.077524557';  ...
'0.67' '0.077459463';  ...
'0.68' '0.077394455';  ...
'0.69' '0.077327934';  ...
'0.7' '0.077258337';  ...
'0.71' '0.077184077';  ...
'0.72' '0.077103499';  ...
'0.73' '0.077014851';  ...
'0.74' '0.076916258';  ...
'0.75' '0.07680571';  ...
'0.76' '0.07668104';  ...
'0.77' '0.07653992';  ...
'0.78' '0.076379839';  ...
'0.79' '0.076198086';  ...
'0.8' '0.075991699';  ...
'0.81' '0.075757371';  ...
'0.82' '0.075491288';  ...
'0.83' '0.075188813';  ...
'0.84' '0.07484398';  ...
'0.85' '0.074448647';  ...
'0.86' '0.07399118';  ...
'0.87' '0.073454466';  ...
'0.88' '0.072812991';  ...
'0.89' '0.072028722';  ...
'0.9' '0.071045433';  ...
'0.91' '0.069780996';  ...
'0.92' '0.068116222';  ...
'0.93' '0.065874599';  ...
'0.94' '0.062770873';  ...
'0.95' '0.058253898';  ...
'0.96' '0.051075794';  ...
'0.97' '0.038790069';  ...
'0.98' '0.020172191'});
model.func('int2').set('interp', 'piecewisecubic');
model.func('an1').set('funcname', 'kappa_e');
model.func('an1').set('expr', '3.45*exp(-798/T)*(ce/1000)^3 - 48.5*exp(-1080/T)*(ce/1000)^2+244*exp(-1440/T)*(ce/1000)');
model.func('an1').set('args', {'ce' 'T'});
model.func('an1').set('argunit', 'mol/m^3, K');
model.func('an1').set('fununit', 'S/m');
model.func('an1').set('plotargs', {'ce' '0' '1'; 'T' '0' '1'});
model.func('an2').set('funcname', 'D_e');
model.func('an2').set('expr', '5.84E-7*exp(-2870/T)*(ce/1000)^2-33.9E-7*exp(-2920/T)*(ce/1000)+129E-7*exp(-3200/T)');
model.func('an2').set('args', {'ce' 'T'});
model.func('an2').set('argunit', 'mol/m^3, K');
model.func('an2').set('fununit', 'm^2/s');
model.func('an2').set('plotargs', {'ce' '0' '1'; 'T' '0' '1'});
model.func('int3').set('table', {'0[d]' '1'; '300[d]' '0.3'});
model.func('int5').label('Graphite Volume Change');
model.func('int5').set('funcname', 'G_dV');
model.func('int5').set('table', {'0.01223' '0.00117';  ...
'0.02099' '0.00421';  ...
'0.03552' '0.00674';  ...
'0.04408' '0.00875';  ...
'0.05583' '0.01055';  ...
'0.06299' '0.01356';  ...
'0.07335' '0.01561';  ...
'0.08788' '0.0189';  ...
'0.10082' '0.02115';  ...
'0.10958' '0.02395';  ...
'0.12272' '0.0262';  ...
'0.13865' '0.02877';  ...
'0.1504' '0.03053';  ...
'0.16493' '0.03254';  ...
'0.17787' '0.03431';  ...
'0.18802' '0.03659';  ...
'0.19977' '0.03812';  ...
'0.21132' '0.04064';  ...
'0.22307' '0.04265';  ...
'0.2376' '0.04442';  ...
'0.24616' '0.0457';  ...
'0.25213' '0.04899';  ...
'0.26806' '0.04975';  ...
'0.28697' '0.05176';  ...
'0.30868' '0.05228';  ...
'0.32341' '0.05228';  ...
'0.33058' '0.05429';  ...
'0.3465' '0.05581';  ...
'0.36402' '0.05733';  ...
'0.38871' '0.0581';  ...
'0.39886' '0.0581';  ...
'0.40762' '0.05858';  ...
'0.42076' '0.05858';  ...
'0.44983' '0.05934';  ...
'0.47591' '0.0601';  ...
'0.49781' '0.06087';  ...
'0.52111' '0.06087';  ...
'0.53843' '0.06139';  ...
'0.55157' '0.06187';  ...
'0.56471' '0.06187';  ...
'0.58641' '0.06215';  ...
'0.60831' '0.07707';  ...
'0.61707' '0.08109';  ...
'0.63001' '0.08261';  ...
'0.65052' '0.08542';  ...
'0.65768' '0.08743';  ...
'0.68237' '0.0902';  ...
'0.69113' '0.09273';  ...
'0.70865' '0.09553';  ...
'0.7202' '0.09854';  ...
'0.73175' '0.10183';  ...
'0.74927' '0.10488';  ...
'0.76818' '0.10692';  ...
'0.78849' '0.11046';  ...
'0.80462' '0.11198';  ...
'0.82492' '0.11551';  ...
'0.83946' '0.11752';  ...
'0.851' '0.11956';  ...
'0.86414' '0.12133';  ...
'0.87868' '0.12815';  ...
'0.89759' '0.12839';  ...
'0.91651' '0.12968';  ...
'0.93383' '0.13068';  ...
'0.94995' '0.13168';  ...
'0' '0'});
model.func('int5').set('interp', 'piecewisecubic');
model.func('int6').label('Graphite Volume Change 1');
model.func('int6').set('funcname', 'fvol');
model.func('int6').set('table', {'0' '0'; '0.5' '0.05'; '0.75' '0.05'; '1' '0.1'});
model.func('int6').set('interp', 'piecewisecubic');
model.func('int6').set('argunit', '1');
model.func('int6').set('fununit', '1');

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').create('i1', 'Interval');
model.component('comp1').geom('geom1').feature('i1').set('coordsource', 'vector');
model.component('comp1').geom('geom1').feature('i1').set('coordvec', '0,L_neg,L_neg+L_sep,L_neg+L_sep+L_pos');
model.component('comp1').geom('geom1').run;
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').selection.create('sel1', 'Explicit');
model.component('comp1').selection('sel1').set([1]);
model.component('comp1').selection.create('sel2', 'Explicit');
model.component('comp1').selection('sel2').set([2]);
model.component('comp1').selection.create('sel3', 'Explicit');
model.component('comp1').selection('sel3').set([3]);
model.component('comp1').selection('sel1').label('Negative Electrode');
model.component('comp1').selection('sel2').label('Seperator');
model.component('comp1').selection('sel3').label('Positive Electrode');

model.component('comp1').variable.create('var34');
model.component('comp1').variable('var34').set('a_s_neg', '3*epsilon_s_neg/r_p_neg');
model.component('comp1').variable('var34').set('i0', '(c_s_max_neg>=liion.cs_surface)*k_neg[mol/m^2/s]*(cl/1[mol/m^3])^0.5*(liion.cs_surface/1[mol/m^3])^0.5*((c_s_max_neg-liion.cs_surface)/1[mol/m^3])^0.5*F_const');
model.component('comp1').variable('var34').set('k_neg', 'k0_neg*exp(Ea_kneg*(1/T_ref-1/T)/R_const)');
model.component('comp1').variable('var34').selection.named('sel1');
model.component('comp1').variable.create('var35');
model.component('comp1').variable('var35').set('soc_pos', '(liion.cs_surface/c_s_max_pos)');
model.component('comp1').variable('var35').set('i0', 'k_pos[mol/m^2/s]*(cl/1[mol/m^3])^0.5*(liion.cs_surface/1[mol/m^3])^0.5*((c_s_max_pos-liion.cs_surface)/1[mol/m^3])^0.5*F_const');
model.component('comp1').variable('var35').set('k_pos', 'k0_pos*exp(Ea_kpos*(1/T_ref-1/T)/R_const)');
model.component('comp1').variable('var35').set('a_s_pos', '3*epsilon_s_pos/r_p_pos');
model.component('comp1').variable('var35').selection.named('sel3');
model.component('comp1').variable.create('var26');
model.component('comp1').variable('var26').set('C_rate', '1/3');
model.component('comp1').variable.create('var27');
model.component('comp1').variable('var27').set('C_rate', '1/3');
model.component('comp1').variable.create('var12');
model.component('comp1').variable('var12').set('i_cell', 'intop2(liion.nIs)', 'Current density');
model.component('comp1').variable('var12').set('I_cell', 'i_cell*A_cell', 'Current');
model.component('comp1').variable('var12').set('E_cell', 'intop2(phis)');
model.component('comp1').variable('var12').set('soc_neg_surf', 'intop1(liion.soc_surface_pce1)/L_neg');
model.component('comp1').variable('var12').set('soc_neg_avg', 'intop1(liion.soc_average_pce1)/L_neg');
model.component('comp1').variable('var12').set('soc_pos_surf', 'intop4(liion.soc_surface_pce2)/L_pos');
model.component('comp1').variable('var12').set('soc_pos_avg', 'intop4(liion.soc_average_pce2)/L_pos');
model.component('comp1').variable('var12').set('cl_avg', 'intop3(cl)/(L_neg+L_sep+L_pos)');
model.component('comp1').variable('var12').set('U_neg_surf', 'U_neg(soc_neg_surf)');
model.component('comp1').variable('var12').set('U_neg_avg', 'U_neg(soc_neg_avg)');
model.component('comp1').variable('var12').set('U_pos_surf', 'U_pos(soc_pos_surf)');
model.component('comp1').variable('var12').set('U_pos_avg', 'U_pos(soc_pos_avg)');
model.component('comp1').variable('var12').set('delta_SEI_avg', 'intop1(delta_SEI)/L_neg');
model.component('comp1').variable('var12').set('epss_neg_avg', 'intop1(liion.epss)/L_neg');
model.component('comp1').variable('var12').set('epsl_neg_avg', 'intop1(liion.epsl)/L_neg');
model.component('comp1').variable('var12').set('epss_pos_avg', 'intop4(liion.epss)/L_pos');
model.component('comp1').variable('var12').set('epsl_pos_avg', 'intop4(liion.epsl)/L_pos');
model.component('comp1').variable('var12').set('c_Mn_avg', 'intop3(c_Mn)/(L_neg+L_sep+L_pos)');
model.component('comp1').variable('var12').set('c_Hplus_avg', 'intop3(c_Hplus)/(L_neg+L_sep+L_pos)');
model.component('comp1').variable('var12').set('c_H2O_avg', 'intop3(c_H2O)/(L_neg+L_sep+L_pos)');
model.component('comp1').variable('var12').set('c_Mn_dep_avg', 'intop1(c_Mn_dep)/(L_neg)');
model.component('comp1').variable('var12').set('sigma_h_max_neg', 'maxop1(liion.sh_surface_pce1)');
model.component('comp1').variable('var12').set('sigma_h_max_pos', 'maxop2(liion.sh_surface_pce1)');
model.component('comp1').variable('var12').set('a_s_neg_avg', 'intop1(a_s_neg)/L_neg');
model.component('comp1').variable('var12').set('a_s_pos_avg', 'intop4(a_s_pos)/L_pos');
model.component('comp1').variable('var12').set('c_s_pos_surf_avg', 'intop4(liion.soc_surface_pce2*c_s_max_pos)/L_pos');
model.component('comp1').variable('var12').set('c_s_neg_surf_avg', 'intop1(liion.soc_surface_pce1*c_s_max_neg)/L_neg');
model.component('comp1').variable('var12').set('cl_tot', 'intop3(cl)');
model.component('comp1').variable('var12').set('c_s_pos_surf_tot', 'intop4(liion.soc_surface_pce2*c_s_max_pos)');
model.component('comp1').variable.create('var8');
model.component('comp1').variable('var8').set('Q_SEI', 'liion.c_pce1_sei*F_const');
model.component('comp1').variable('var8').set('cycle_no', 'comp1.liion.cdc1.cycle_counter');
model.component('comp1').variable('var8').set('dch_filter', 'comp1.liion.cdc1.CC_DCH');
model.component('comp1').variable('var8').set('dch_start_filter', 'comp1.liion.cdc1.CC_DCH&& ((t-1)<comp1.liion.cdc1.t_dch_start)');
model.component('comp1').variable('var8').set('ch_start_filter', 'comp1.liion.cdc1.CC_CH && ((t-1)<comp1.liion.cdc1.t_ch_start && cycle_no>0)');
model.component('comp1').variable('var8').set('first_cycle_filter', 'comp1.liion.cdc1.cycle_counter==0');
model.component('comp1').variable('var8').set('last_cycle_filter', 'comp1.liion.cdc1.cycle_counter*t_factor==no_cycles');
model.component('comp1').variable('var8').set('Q_cell', 'if(comp1.liion.cdc1.CC_CH, (t-liion.cdc1.t_ch_start)*I_app, 0) + if(comp1.liion.cdc1.CC_DCH, (t-liion.cdc1.t_dch_start)*I_app, 0)');
model.component('comp1').variable.create('var3');
model.component('comp1').variable('var3').set('i_SEI0', '(exp(-lambda_SEI0*delta_SEI))*(F_const*k_SEI*c_EC0)*(-exp(-alpha_c_SEI*F_const/(R_const*T)*(liion.eta_per2)))*exp(Ea_SEI*(1/T_ref-1/T)/R_const)');
model.component('comp1').variable('var3').set('delta_SEI0', '0.1[nm]');
model.component('comp1').variable('var3').set('U_SEI', '0 [V]');
model.component('comp1').variable('var3').set('kappa_SEI', '5E-6[S/m]', 'Conductivity of SEI');
model.component('comp1').variable('var3').set('r_SEI', 'delta_SEI/kappa_SEI');
model.component('comp1').variable('var3').set('SEI_rate', '-i_SEI/2/F_const*M_SEI/rho_SEI');
model.component('comp1').variable('var3').set('c_SEI', 'liion.c_pce1_sei');
model.component('comp1').variable('var3').set('eta_SEI', 'liion.eta_per2');
model.component('comp1').variable('var3').set('delta_SEI', 'liion.sb_pce1_sei+delta_SEI0');
model.component('comp1').variable('var3').set('i_SEI', 'min(0[A/m^2],i_SEI0)');
model.component('comp1').variable('var3').selection.geom('geom1', 1);
model.component('comp1').variable('var3').selection.set([1]);
model.component('comp1').variable.create('var11');
model.component('comp1').variable('var11').set('a_c', 'a_s_pos', 'Carbon surface area per volume, now assumed as same as a_s_pos');
model.component('comp1').variable('var11').set('alpha_a_sol', '0.5');
model.component('comp1').variable('var11').set('f_Hplus', '0.10');
model.component('comp1').variable('var11').set('i_oxid', 'i0_sol*exp(((alpha_a_sol*F_const)/(R_const*T))*(eta_oxid))*exp(Ea_sol*(1/T_ref-1/T)/R_const)', 'current density of solvent oxidation');
model.component('comp1').variable('var11').set('i0_sol', '1[A*m^-3]/a_s_pos*k_sol', 'BW: Seems like multiplied by a_s_pos');
model.component('comp1').variable('var11').set('j_oxid_Hplus', 'f_Hplus*a_s_pos*i_oxid', 'H+ generation rate by solvent oxidation');
model.component('comp1').variable('var11').set('U_oxid', '4.100000e+00 [V]', 'equilibrium potential of solvent oxidation');
model.component('comp1').variable('var11').set('eta_oxid', 'liion.eta_per2');
model.component('comp1').variable('var11').selection.geom('geom1', 1);
model.component('comp1').variable('var11').selection.set([3]);
model.component('comp1').variable.create('var33');
model.component('comp1').variable('var33').set('i_diss', 'i0_diss*exp(alpha_a_diss*n_diss*F_const*eta_diss/(R_const*T))/(n_diss*F_const*q_diss)*exp(Ea_diss_Kindermann*(1/T_ref-1/T)/R_const)');
model.component('comp1').variable('var33').set('E_diss', '4 [V]');
model.component('comp1').variable('var33').set('eta_diss', 'liion.eta_per1-E_diss');
model.component('comp1').variable('var33').set('i0_diss', '1[A/m^2]*k_diss_Kindermann');
model.component('comp1').variable('var33').set('n_diss', '1');
model.component('comp1').variable('var33').set('alpha_a_diss', '0.5');
model.component('comp1').variable('var33').set('q_diss', 'c_s_max_pos*L_pos');
model.component('comp1').variable('var33').selection.named('sel3');

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat1').propertyGroup('def').func.create('int1', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup.create('ElectrolyteConductivity', 'Electrolyte conductivity');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').func.create('int1', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup.create('SpeciesProperties', 'Species properties');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').func.create('int1', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').func.create('int2', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup.create('ElectrolyteSaltConcentration', 'Electrolyte salt concentration');
model.component('comp1').material('mat2').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func.create('int2', 'Interpolation');
model.component('comp1').material('mat2').propertyGroup.create('OperationalSOC', 'Operational electrode state-of-charge');
model.component('comp1').material('mat3').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.component('comp1').material('mat3').propertyGroup.create('OperationalSOC', 'Operational electrode state-of-charge');

model.component('comp1').cpl.create('intop2', 'Integration');
model.component('comp1').cpl.create('intop1', 'Integration');
model.component('comp1').cpl.create('intop3', 'Integration');
model.component('comp1').cpl.create('intop4', 'Integration');
model.component('comp1').cpl.create('aveop1', 'Average');
model.component('comp1').cpl.create('maxop1', 'Maximum');
model.component('comp1').cpl.create('maxop2', 'Maximum');
model.component('comp1').cpl.create('minop1', 'Minimum');
model.component('comp1').cpl.create('minop2', 'Minimum');
model.component('comp1').cpl.create('minop3', 'Minimum');
model.component('comp1').cpl('intop2').selection.geom('geom1', 0);
model.component('comp1').cpl('intop2').selection.set([4]);
model.component('comp1').cpl('intop1').selection.set([1]);
model.component('comp1').cpl('intop3').selection.all;
model.component('comp1').cpl('intop4').selection.named('sel3');
model.component('comp1').cpl('aveop1').selection.all;
model.component('comp1').cpl('maxop1').selection.named('sel1');
model.component('comp1').cpl('maxop2').selection.named('sel3');
model.component('comp1').cpl('minop1').selection.named('sel1');
model.component('comp1').cpl('minop2').selection.named('sel3');
model.component('comp1').cpl('minop3').selection.all;

model.component('comp1').physics.create('liion', 'LithiumIonBatteryMPH', 'geom1');
model.component('comp1').physics('liion').create('init2', 'init', 1);
model.component('comp1').physics('liion').feature('init2').selection.set([3]);
model.component('comp1').physics('liion').create('pce1', 'PorousElectrode', 1);
model.component('comp1').physics('liion').feature('pce1').selection.set([1]);
model.component('comp1').physics('liion').feature('pce1').create('per2', 'PorousElectrodeReaction', 1);
model.component('comp1').physics('liion').feature('pce1').create('ivdds1', 'InitialValuesForDissolvingDepositingSpecies', 1);
model.component('comp1').physics('liion').create('pce2', 'PorousElectrode', 1);
model.component('comp1').physics('liion').feature('pce2').selection.set([3]);
model.component('comp1').physics('liion').feature('pce2').create('per2', 'PorousElectrodeReaction', 1);
model.component('comp1').physics('liion').create('sep1', 'Separator', 1);
model.component('comp1').physics('liion').feature('sep1').selection.set([2]);
model.component('comp1').physics('liion').create('egnd1', 'ElectricGround', 0);
model.component('comp1').physics('liion').feature('egnd1').selection.set([1]);
model.component('comp1').physics('liion').create('rs1', 'ReactionSource', 1);
model.component('comp1').physics('liion').feature('rs1').selection.named('sel3');
model.component('comp1').physics('liion').create('ecd1', 'ElectrodeNormalCurrentDensity', 0);
model.component('comp1').physics('liion').feature('ecd1').selection.set([4]);
model.component('comp1').physics('liion').create('ecd2', 'ElectrodeNormalCurrentDensity', 0);
model.component('comp1').physics('liion').feature('ecd2').selection.set([4]);
model.component('comp1').physics('liion').create('ecd3', 'ElectrodeNormalCurrentDensity', 0);
model.component('comp1').physics('liion').feature('ecd3').selection.set([4]);
model.component('comp1').physics('liion').create('pot1', 'ElectricPotential', 0);
model.component('comp1').physics('liion').feature('pot1').selection.set([4]);
model.component('comp1').physics('liion').create('pot2', 'ElectricPotential', 0);
model.component('comp1').physics('liion').feature('pot2').selection.set([4]);
model.component('comp1').physics('liion').create('pot3', 'ElectricPotential', 0);
model.component('comp1').physics('liion').feature('pot3').selection.set([4]);
model.component('comp1').physics.create('ge', 'GlobalEquations', 'geom1');
model.component('comp1').physics('ge').feature('ge1').set('DependentVariableQuantity', 'none');
model.component('comp1').physics('ge').feature('ge1').set('CustomDependentVariableUnit', 'C');
model.component('comp1').physics.create('dode2', 'DomainODE', 'geom1');
model.component('comp1').physics('dode2').identifier('dode2');
model.component('comp1').physics('dode2').field('dimensionless').field('u6');
model.component('comp1').physics('dode2').field('dimensionless').component({'epsilon_s_neg'});
model.component('comp1').physics('dode2').selection.named('sel1');
model.component('comp1').physics.create('dode3', 'DomainODE', 'geom1');
model.component('comp1').physics('dode3').identifier('dode3');
model.component('comp1').physics('dode3').field('dimensionless').field('u7');
model.component('comp1').physics('dode3').field('dimensionless').component({'epsilon_s_pos'});
model.component('comp1').physics('dode3').selection.named('sel3');

model.component('comp1').mesh('mesh1').autoMeshSize(1);

model.component('comp1').probe.create('pdom1', 'DomainPoint');
model.component('comp1').probe('pdom1').create('ppb2', 'PointExpr');
model.component('comp1').probe('pdom1').create('ppb5', 'PointExpr');
model.component('comp1').probe('pdom1').create('ppb6', 'PointExpr');
model.component('comp1').probe('pdom1').create('ppb7', 'PointExpr');
model.component('comp1').probe('pdom1').create('ppb8', 'PointExpr');
model.component('comp1').probe('pdom1').create('ppb9', 'PointExpr');
model.component('comp1').probe('pdom1').create('ppb10', 'PointExpr');
model.component('comp1').probe('pdom1').create('ppb11', 'PointExpr');

model.result.table('tbl1').label('Probe Table 1');

model.component('comp1').variable('var34').label('Negative Electrode');
model.component('comp1').variable('var35').label('Positive Electrode');
model.component('comp1').variable('var26').active(false);
model.component('comp1').variable('var26').label('Cycling Charging');
model.component('comp1').variable('var27').active(false);
model.component('comp1').variable('var27').label('Cycling Discharging');
model.component('comp1').variable('var12').label('Result Filters');
model.component('comp1').variable('var8').label('Filter');
model.component('comp1').variable('var3').label('SEI');
model.component('comp1').variable('var11').label('Solvent Oxidation');
model.component('comp1').variable('var33').label('Kindermann Cathode Dissolution');

model.component('comp1').view('view1').axis.set('xmin', -1.8999999156221747E-5);
model.component('comp1').view('view1').axis.set('xmax', 3.9900001138448715E-4);

model.component('comp1').material('mat1').label('LiPF6 in 3:7 EC:EMC (Liquid electrolyte, Li-ion Battery)');
model.component('comp1').material('mat1').comments(['Non-isothermal properties\n\n3:7 EC:EMC by weight. Solvent velocity set to zero.\n\nReferences\nElectrolyte characterization\nA. Nyman, M. Behm, and G. Lindbergh, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Electrochemical characterisation and modelling of the mass transport phenomena in LiPF6-EC-EMC,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' Electrochim. Acta, vol. 53, p. 6356, 2008.\n\nTemperature dependence\nT. G. Zavalis, M. Behm, and G. Lindbergh, "Investigations of Short-Circuit Scenarios in a Lithium-Ion Battery Cell," J. Electrochem. Soc., vol. 159, p. A848, 2012.']);
model.component('comp1').material('mat1').set('groups', {'electrolytes' 'Electrolytes'});
model.component('comp1').material('mat1').propertyGroup('def').func('int1').set('funcname', 'DL_int1');
model.component('comp1').material('mat1').propertyGroup('def').func('int1').set('table', {'200' '3.9e-10/(1-200*59e-6)';  ...
'500' '4.12e-10/(1-500*59e-6)';  ...
'800' '4e-10/(1-800*59e-6)';  ...
'1000' '3.8e-10/(1-1000*59e-6)';  ...
'1200' '3.50e-10/(1-1200*59e-6)';  ...
'1600' '2.68e-10/(1-1600*59e-6)';  ...
'2000' '1.9e-10/(1-2000*59e-6)'});
model.component('comp1').material('mat1').propertyGroup('def').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat1').propertyGroup('def').func('int1').set('fununit', 'm^2/s');
model.component('comp1').material('mat1').propertyGroup('def').set('diffusion', {'DL_int1(c/1[mol/m^3])*exp(16500/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))' '0' '0' '0' 'DL_int1(c/1[mol/m^3])*exp(16500/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))' '0' '0' '0' 'DL_int1(c/1[mol/m^3])*exp(16500/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))'});
model.component('comp1').material('mat1').propertyGroup('def').set('T_ref', '298[K]');
model.component('comp1').material('mat1').propertyGroup('def').set('T2', 'min(393.15,max(T,223.15))');
model.component('comp1').material('mat1').propertyGroup('def').addInput('concentration');
model.component('comp1').material('mat1').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').func('int1').set('funcname', 'sigmal_int1');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').func('int1').set('table', {'0' '1e-6';  ...
'200' '0.455';  ...
'500' '0.783';  ...
'800' '0.935';  ...
'1000' '0.95';  ...
'1200' '0.927';  ...
'1600' '0.78';  ...
'2000' '0.60';  ...
'2200' '0.515'});
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').func('int1').set('fununit', 'S/m');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').set('sigmal', {'sigmal_int1(c/1[mol/m^3])*exp(4000/8.314*(1/(T_ref2/1[K])-1/(T3/1[K])))' '0' '0' '0' 'sigmal_int1(c/1[mol/m^3])*exp(4000/8.314*(1/(T_ref2/1[K])-1/(T3/1[K])))' '0' '0' '0' 'sigmal_int1(c/1[mol/m^3])*exp(4000/8.314*(1/(T_ref2/1[K])-1/(T3/1[K])))'});
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').set('T_ref2', '298[K]');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').set('T3', 'min(393.15,max(T,223.15))');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').addInput('concentration');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').func('int1').set('funcname', 'transpNm_int1');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').func('int1').set('table', {'200' '0.37';  ...
'500' '0.322';  ...
'800' '0.27';  ...
'1000' '0.251';  ...
'1200' '0.248';  ...
'1600' '0.236';  ...
'2000' '0.11'});
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').func('int2').set('funcname', 'actdep_int1');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').func('int2').set('table', {'200' '0';  ...
'500' '0.29';  ...
'800' '0.695';  ...
'1000' '1';  ...
'1200' '1.32';  ...
'1600' '2.07';  ...
'2000' '2.50'});
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').func('int2').set('interp', 'piecewisecubic');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').set('transpNum', '');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').set('fcl', '');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').set('transpNum', '');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').set('fcl', '');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').set('transpNum', 'transpNm_int1(c/1[mol/m^3])');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').set('fcl', 'actdep_int1(c/1[mol/m^3])*exp(-1000/8.314*(1/(T_ref3/1[K])-1/(T4/1[K])))');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').set('T4', 'min(393.15,max(T,223.15))');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').set('T_ref3', '298[K]');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').addInput('concentration');
model.component('comp1').material('mat1').propertyGroup('SpeciesProperties').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteSaltConcentration').identifier('cElsalt');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteSaltConcentration').set('cElsalt', '1200[mol/m^3]');
model.component('comp1').material('mat2').label('Graphite Electrode, LixC6 MCMB (Negative, Li-ion Battery)');
model.component('comp1').material('mat2').comments(['Eeq for fully lithiated at 0.98\nEeq for delithiated at 0\n\nReferences\nV. Srinivasan, and J. Newman, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Design and Optimization of a Natural Graphite/Iron Phosphate Lithium Ion Cell,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Electrochem. Soc., vol. 151, p. 1530, 2004.\n\nK. Kumaresan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermal Model for a Li-Ion Cell,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Electrochem. Soc., vol. 155, p. A164, 2008.\n\nR. E. Gerver and J. P. Meyers, "Three-Dimensional Modeling of Electrochemical Performance and Heat Generation of Lithium-Ion Betteries in Tabbed Planar Configurations", J. Electrochemical Soc., vol. 158, p. A835, 2011\n\nK. E. Thomas, and J. Newman, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Heats of mixing and of entropy in porous insertion electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources., vol. 119-121, p. 844, 2003.']);
model.component('comp1').material('mat2').set('groups', {'electrodes' 'Electrodes'});
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'100[S/m]' '0' '0' '0' '100[S/m]' '0' '0' '0' '100[S/m]'});
model.component('comp1').material('mat2').propertyGroup('def').set('diffusion', {'1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]'});
model.component('comp1').material('mat2').propertyGroup('def').set('thermalconductivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat2').propertyGroup('def').set('heatcapacity', '881');
model.component('comp1').material('mat2').propertyGroup('def').set('density', '2270');
model.component('comp1').material('mat2').propertyGroup('def').set('T_ref', '318[K]');
model.component('comp1').material('mat2').propertyGroup('def').set('T2', 'min(393.15,max(T,223.15))');
model.component('comp1').material('mat2').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func('int1').set('table', {'0' '2.781186612';  ...
'0.01' '1.520893224';  ...
'0.02' '0.893922607';  ...
'0.03' '0.581284406';  ...
'0.04' '0.42452844';  ...
'0.05' '0.344895805';  ...
'0.06' '0.303146342';  ...
'0.07' '0.279578072';  ...
'0.08' '0.264093089';  ...
'0.09' '0.251347845';  ...
'0.1' '0.238588379';  ...
'0.11' '0.224803164';  ...
'0.12' '0.210294358';  ...
'0.13' '0.196408586';  ...
'0.14' '0.184624188';  ...
'0.15' '0.175188157';  ...
'0.16' '0.167373311';  ...
'0.17' '0.160452107';  ...
'0.18' '0.154025412';  ...
'0.19' '0.147948522';  ...
'0.2' '0.142214997';  ...
'0.21' '0.13688271';  ...
'0.22' '0.132033114';  ...
'0.23' '0.127747573';  ...
'0.24' '0.124091616';  ...
'0.25' '0.121103387';  ...
'0.26' '0.11878567';  ...
'0.27' '0.117102317';  ...
'0.28' '0.115980205';  ...
'0.29' '0.115317054';  ...
'0.3' '0.114993965';  ...
'0.31' '0.114890105';  ...
'0.32' '0.114896278';  ...
'0.33' '0.114924619';  ...
'0.34' '0.114913068';  ...
'0.35' '0.114824904';  ...
'0.36' '0.114644725';  ...
'0.37' '0.114372614';  ...
'0.38' '0.114017954';  ...
'0.39' '0.11359371';  ...
'0.4' '0.11311133';  ...
'0.41' '0.112575849';  ...
'0.42' '0.111980245';  ...
'0.43' '0.111297682';  ...
'0.44' '0.110470149';  ...
'0.45' '0.109393081';  ...
'0.46' '0.107900592';  ...
'0.47' '0.10576964';  ...
'0.48' '0.102783317';  ...
'0.49' '0.09889031';  ...
'0.5' '0.094391564';  ...
'0.51' '0.089921069';  ...
'0.52' '0.086112415';  ...
'0.53' '0.083265315';  ...
'0.54' '0.081326247';  ...
'0.55' '0.080074892';  ...
'0.56' '0.07928329';  ...
'0.57' '0.078778765';  ...
'0.58' '0.078447703';  ...
'0.59' '0.078220432';  ...
'0.6' '0.078055641';  ...
'0.61' '0.077929111';  ...
'0.62' '0.077826563';  ...
'0.63' '0.077739397';  ...
'0.64' '0.077662227';  ...
'0.65' '0.077591472';  ...
'0.66' '0.077524557';  ...
'0.67' '0.077459463';  ...
'0.68' '0.077394455';  ...
'0.69' '0.077327934';  ...
'0.7' '0.077258337';  ...
'0.71' '0.077184077';  ...
'0.72' '0.077103499';  ...
'0.73' '0.077014851';  ...
'0.74' '0.076916258';  ...
'0.75' '0.07680571';  ...
'0.76' '0.07668104';  ...
'0.77' '0.07653992';  ...
'0.78' '0.076379839';  ...
'0.79' '0.076198086';  ...
'0.8' '0.075991699';  ...
'0.81' '0.075757371';  ...
'0.82' '0.075491288';  ...
'0.83' '0.075188813';  ...
'0.84' '0.07484398';  ...
'0.85' '0.074448647';  ...
'0.86' '0.07399118';  ...
'0.87' '0.073454466';  ...
'0.88' '0.072812991';  ...
'0.89' '0.072028722';  ...
'0.9' '0.071045433';  ...
'0.91' '0.069780996';  ...
'0.92' '0.068116222';  ...
'0.93' '0.065874599';  ...
'0.94' '0.062770873';  ...
'0.95' '0.058253898';  ...
'0.96' '0.051075794';  ...
'0.97' '0.038790069';  ...
'0.98' '0.020172191'});
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func('int1').set('fununit', 'V');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func('int2').set('funcname', 'dEeqdT_int1');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func('int2').set('table', {'0' '3.0e-4';  ...
'0.17' '0';  ...
'0.24' '-6e-5';  ...
'0.28' '-1.6e-4';  ...
'0.5' '-1.6e-4';  ...
'0.54' '-9e-5';  ...
'0.71' '-9e-5';  ...
'0.85' '-1.0e-4';  ...
'1.0' '-1.2e-4'});
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').func('int2').set('fununit', 'V/K');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('Eeq', '');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('dEeqdT', '');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('cEeqref', '');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('Eeq', '');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('dEeqdT', '');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('cEeqref', '');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)+dEeqdT_int1(soc)*(T-298[K])');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('dEeqdT', 'dEeqdT_int1(soc)');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('cEeqref', '31507[mol/m^3]');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').addInput('concentration');
model.component('comp1').material('mat2').propertyGroup('ElectrodePotential').addInput('temperature');
model.component('comp1').material('mat2').propertyGroup('OperationalSOC').set('socmax', '');
model.component('comp1').material('mat2').propertyGroup('OperationalSOC').set('socmin', '');
model.component('comp1').material('mat2').propertyGroup('OperationalSOC').set('socmax', '0.98');
model.component('comp1').material('mat2').propertyGroup('OperationalSOC').set('socmin', '0');
model.component('comp1').material('mat3').label('NMC Electrode, LiNi1/3Mn1/3Co1/3O2 (Positive, Li-ion Battery)');
model.component('comp1').material('mat3').comments(['vs Li/Li+, T=25 C\nEeq for fully lithiated at 0.975\nEeq for delithiated at 0\ncEqref estimated for a density of 4.7 g/cm3\n\nReference\nW. Zheng, M. Shui, J. Shu, S. Gao, D. Xu, L. Chen, L. Feng and Y. Ren, " GITT studies on oxide cathode LiNi1/3Co1/3Mn1/3O2 synthesized by citric acid assisted high-energy ball milling", Bull. Mater. Sci., vol. 36, p. A495, 2013\n\ndEeqdT: \nV Viswanathan, D Choi, D Wang, W Xu, S Towne, R Williford, JG Zhang, J Liu and Z Yang "Effect of entropy change on lithium intercalation in cathodes and anodes on Li-ion battery thermal management", Journal of Power Sources 195 (2010) 3720-3729']);
model.component('comp1').material('mat3').set('groups', {'electrodes' 'Electrodes'});
model.component('comp1').material('mat3').propertyGroup('def').set('diffusion', {'5e-13' '0' '0' '0' '5e-13' '0' '0' '0' '5e-13'});
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'100' '0' '0' '0' '100' '0' '0' '0' '100'});
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('table', {'0' '4.44';  ...
'0.032' '4.34';  ...
'0.102' '4.23';  ...
'0.187' '4.13';  ...
'0.289' '4.025';  ...
'0.38' '3.945';  ...
'0.543' '3.835';  ...
'0.775' '3.71';  ...
'0.872' '3.62';  ...
'0.925' '3.51';  ...
'0.943' '3.42';  ...
'0.957' '3.30';  ...
'0.966' '3.165';  ...
'0.970' '3.02';  ...
'0.972' '2.90';  ...
'0.975' '2.688'});
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('extrap', 'linear');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('fununit', 'V');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('Eeq', '');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('dEeqdT', '');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('cEeqref', '');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('Eeq', '');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('dEeqdT', '');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('cEeqref', '');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)+dEeqdT*(T-298[K])');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('dEeqdT', '-10[J/mol/K]/F_const');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('cEeqref', '49000[mol/m^3]');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').addInput('concentration');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').addInput('temperature');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('socmax', '');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('socmin', '');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('socmax', '0.975');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('socmin', '0');

model.component('comp1').physics('liion').label('Full Cell');
model.component('comp1').physics('liion').prop('ShapeProperty').set('order_electricpotential', 1);
model.component('comp1').physics('liion').prop('ac').set('ac', 'A_cell');
model.component('comp1').physics('liion').feature('ice1').set('sigmal', {'kappa_e(cl,T)'; '0'; '0'; '0'; 'kappa_e(cl,T)'; '0'; '0'; '0'; 'kappa_e(cl,T)'});
model.component('comp1').physics('liion').feature('ice1').set('Dl', 'D_e(cl,T)');
model.component('comp1').physics('liion').feature('ice1').set('transpNum', 't_plus0');
model.component('comp1').physics('liion').feature('ice1').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('ice1').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('init1').set('phil', '-U_neg(soc0_neg)');
model.component('comp1').physics('liion').feature('init1').set('cl', 'c_e0');
model.component('comp1').physics('liion').feature('init2').set('phil', '-U_neg(soc0_neg)');
model.component('comp1').physics('liion').feature('init2').set('cl', 'c_e0');
model.component('comp1').physics('liion').feature('init2').set('phis', 'U_pos(soc0_pos)-U_neg(soc0_neg)');
model.component('comp1').physics('liion').feature('pce1').set('sigmal', {'kappa_e(cl,T)'; '0'; '0'; '0'; 'kappa_e(cl,T)'; '0'; '0'; '0'; 'kappa_e(cl,T)'});
model.component('comp1').physics('liion').feature('pce1').set('Dl', 'D_e(cl,T)');
model.component('comp1').physics('liion').feature('pce1').set('transpNum', 't_plus0');
model.component('comp1').physics('liion').feature('pce1').set('ElectrodeMaterial', 'mat2');
model.component('comp1').physics('liion').feature('pce1').set('sigma', {'kappa_s_neg'; '0'; '0'; '0'; 'kappa_s_neg'; '0'; '0'; '0'; 'kappa_s_neg'});
model.component('comp1').physics('liion').feature('pce1').set('epsl', 'epsilon_e_neg0');
model.component('comp1').physics('liion').feature('pce1').set('epss', 'epsilon_s_neg');
model.component('comp1').physics('liion').feature('pce1').set('AddVolumeChangeToElectrodeVolumeFraction', false);
model.component('comp1').physics('liion').feature('pce1').set('Species', 'sei');
model.component('comp1').physics('liion').feature('pce1').set('Ms', 'M_SEI');
model.component('comp1').physics('liion').feature('pce1').set('rhos', 'rho_SEI');
model.component('comp1').physics('liion').feature('pce1').set('sf0', 0);
model.component('comp1').physics('liion').feature('pce1').set('dsf', 'delta_SEI');
model.component('comp1').physics('liion').feature('pce1').set('sigmaf', 'kappa_SEI');
model.component('comp1').physics('liion').feature('pce1').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('pce1').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('pce1').label('Anode');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('csinit', 'c_s0_neg');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('Ds', 'D_s_neg');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('ParticleMaterial', 'mat2');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('cEeqref', 'c_s_max_neg');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('socmin', 'theta0_neg');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('socmax', 'theta100_neg');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('rp', 'r_p_neg');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('Nel', 39);
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('fvol', 'G_dV(liion.cs_pce1/liion.csmax)');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('E', '10[GPa]');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('pin1').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('MaterialOption', 'mat2');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('Eeq', 'U_neg(liion.cs_surface/c_s_max_neg)');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('ElectrodeKinetics', 'ButlerVolmer');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('i0', 'i0');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('alphaa', 'alpha_a_neg');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('alphac', 'alpha_c_neg');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('i0_ref', 'k_neg[mol/m^2/s]*F_const');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('c0_ref', '1[mol/m^3]');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('ActiveSpecificSurfaceAreaType', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('Av', 'a_s_neg');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('dEeqdT_mat', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('per1').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('MaterialOption', 'mat2');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('Eeq_mat', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('Eeq', 'U_SEI');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('ElectrodeKinetics', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('iloc', 'i_SEI');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('i0', 'min(0, (exp(-lambda_SEI*delta_SEI))*(F_const*k_SEI*c_EC))');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('alphaa', 0);
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('alphac', 'alpha_c_SEI');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('i0_ref', '5e-3[A/m^2]');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('cl_ref', '1[mol/m^3]');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('c0_ref', '1[mol/m^3]');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('ActiveSpecificSurfaceAreaType', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('Av', 'a_s_neg');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('VLiTheta', 0);
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('Vib', '1/2');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('dEeqdT_mat', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('pce1').feature('per2').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('pce1').feature('per2').label('SEI');
model.component('comp1').physics('liion').feature('pce2').set('sigmal', {'kappa_e(cl,T)'; '0'; '0'; '0'; 'kappa_e(cl,T)'; '0'; '0'; '0'; 'kappa_e(cl,T)'});
model.component('comp1').physics('liion').feature('pce2').set('Dl', 'D_e(cl,T)');
model.component('comp1').physics('liion').feature('pce2').set('transpNum', 't_plus0');
model.component('comp1').physics('liion').feature('pce2').set('sigma_mat', 'userdef');
model.component('comp1').physics('liion').feature('pce2').set('sigma', {'kappa_s_pos'; '0'; '0'; '0'; 'kappa_s_pos'; '0'; '0'; '0'; 'kappa_s_pos'});
model.component('comp1').physics('liion').feature('pce2').set('epsl', 'epsilon_e_pos0');
model.component('comp1').physics('liion').feature('pce2').set('epss', 'epsilon_s_pos');
model.component('comp1').physics('liion').feature('pce2').set('AddVolumeChangeToElectrodeVolumeFraction', false);
model.component('comp1').physics('liion').feature('pce2').set('SubtractVolumeChangeFromElectrolyteVolumeFraction', false);
model.component('comp1').physics('liion').feature('pce2').set('Ms', []);
model.component('comp1').physics('liion').feature('pce2').set('rhos', []);
model.component('comp1').physics('liion').feature('pce2').set('dsf', 'delta_pos');
model.component('comp1').physics('liion').feature('pce2').set('sigmaf', 'kappa_SEI');
model.component('comp1').physics('liion').feature('pce2').set('constraintMethod', 'nodal');
model.component('comp1').physics('liion').feature('pce2').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('pce2').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('pce2').label('Cathode');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('csinit', 'c_s0_pos');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('Ds', 'D_s_pos');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('ParticleMaterial', 'mat3');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('cEeqref', 'c_s_max_pos');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('socmin', 'theta0_pos');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('socmax', 'theta100_pos');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('rp', 'r_p_pos');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('Nel', 39);
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('pin1').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('MaterialOption', 'mat3');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('Eeq_mat', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('Eeq', 'U_pos(liion.cs_surface/c_s_max_pos)');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('ElectrodeKinetics', 'ButlerVolmer');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('i0', 'i0');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('alphaa', 'alpha_a_pos');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('alphac', 'alpha_a_pos');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('i0_ref', '(k0_pos*k0_pos)^alpha_a_pos*F_const*liion.csmax/2');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('cl_ref', '1[mol/m^3]');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('c0_ref', '1[mol/m^3]');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('ActiveSpecificSurfaceAreaType', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('Av', 'a_s_pos');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('dEeqdT_mat', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('per1').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('Eeq_mat', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('Eeq', 'U_oxid');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('ElectrodeKinetics', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('iloc', 'i_oxid');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('i0', 'i_oxid');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('i0_ref', '5e-3[A/m^2]');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('cl_ref', '1[mol/m^3]');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('c0_ref', '1[mol/m^3]');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('ActiveSpecificSurfaceAreaType', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('Av', 'a_s_pos');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('VLiPlus', 0);
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('VLiTheta', 0);
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('pce2').feature('per2').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('pce2').feature('per2').label('Solvent Oxidation (2)');
model.component('comp1').physics('liion').feature('sep1').set('sigmal', {'kappa_e(cl,T)'; '0'; '0'; '0'; 'kappa_e(cl,T)'; '0'; '0'; '0'; 'kappa_e(cl,T)'});
model.component('comp1').physics('liion').feature('sep1').set('Dl', 'D_e(cl,T)');
model.component('comp1').physics('liion').feature('sep1').set('transpNum', 't_plus0');
model.component('comp1').physics('liion').feature('sep1').set('epsl', 'epsilon_e_sep');
model.component('comp1').physics('liion').feature('sep1').set('minput_temperature_src', 'userdef');
model.component('comp1').physics('liion').feature('sep1').set('minput_temperature', 'T');
model.component('comp1').physics('liion').feature('rs1').set('Rlsrc', 'i_oxid/F_const*a_s_pos');
model.component('comp1').physics('liion').feature('rs1').label('Li Source');
model.component('comp1').physics('liion').feature('ecd1').label('Rest');
model.component('comp1').physics('liion').feature('ecd2').set('nis', 'I_app/A_cell');
model.component('comp1').physics('liion').feature('ecd2').label('Charge CC');
model.component('comp1').physics('liion').feature('ecd3').set('nis', '-I_app/A_cell');
model.component('comp1').physics('liion').feature('ecd3').label('Discharge CC');
model.component('comp1').physics('liion').feature('pot1').set('phisbnd', 'E_max');
model.component('comp1').physics('liion').feature('pot1').label('Charge CV');
model.component('comp1').physics('liion').feature('pot2').set('phisbnd', 'E_min');
model.component('comp1').physics('liion').feature('pot2').label('Discharge CV');
model.component('comp1').physics('liion').feature('pot3').set('phisbnd', 'V_storage(SOC_storage)');
model.component('comp1').physics('liion').feature('pot3').label('Storage CV');
model.component('comp1').physics('ge').label('Q');
model.component('comp1').physics('ge').feature('ge1').set('name', 'Q');
model.component('comp1').physics('ge').feature('ge1').set('equation', 'Qt-I_cell');
model.component('comp1').physics('ge').feature('ge1').set('SourceTermQuantity', 'none');
model.component('comp1').physics('ge').feature('ge1').set('CustomSourceTermUnit', 'A');
model.component('comp1').physics('dode2').label('Negative Solid Volume Fraction');
model.component('comp1').physics('dode2').prop('Units').set('CustomSourceTermUnit', '1/s');
model.component('comp1').physics('dode2').feature('dode1').set('f', 0);
model.component('comp1').physics('dode2').feature('init1').set('epsilon_s_neg', 'epsilon_s_neg0');
model.component('comp1').physics('dode3').label('Positive Solid Volume Fraction');
model.component('comp1').physics('dode3').prop('Units').set('CustomSourceTermUnit', '1/s');
model.component('comp1').physics('dode3').feature('dode1').set('f', '-i_diss');
model.component('comp1').physics('dode3').feature('init1').set('epsilon_s_pos', 'epsilon_s_pos0');

model.component('comp1').probe('pdom1').setIndex('coords1', 'L_neg+L_pos+L_sep', 0);
model.component('comp1').probe('pdom1').set('bndsnap1', true);
model.component('comp1').probe('pdom1').feature('ppb1').set('expr', 'phis');
model.component('comp1').probe('pdom1').feature('ppb1').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb1').set('descr', 'E_cell');
model.component('comp1').probe('pdom1').feature('ppb1').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb1').set('window', 'window7');
model.component('comp1').probe('pdom1').feature('ppb2').set('expr', 'I_cell');
model.component('comp1').probe('pdom1').feature('ppb2').set('unit', 'A');
model.component('comp1').probe('pdom1').feature('ppb2').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb2').set('descr', 'I_cell');
model.component('comp1').probe('pdom1').feature('ppb2').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb2').set('window', 'window7');
model.component('comp1').probe('pdom1').feature('ppb5').label('Point Probe Expression 3');
model.component('comp1').probe('pdom1').feature('ppb5').set('probename', 'ppb3');
model.component('comp1').probe('pdom1').feature('ppb5').set('expr', 'minop1(liion.cs_surface)');
model.component('comp1').probe('pdom1').feature('ppb5').set('unit', 'mol/m^3');
model.component('comp1').probe('pdom1').feature('ppb5').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb5').set('descr', 'c_s_surf_neg_min');
model.component('comp1').probe('pdom1').feature('ppb5').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb5').set('window', 'window7');
model.component('comp1').probe('pdom1').feature('ppb6').label('Point Probe Expression 4');
model.component('comp1').probe('pdom1').feature('ppb6').set('probename', 'ppb4');
model.component('comp1').probe('pdom1').feature('ppb6').set('expr', 'minop2(liion.cs_surface)');
model.component('comp1').probe('pdom1').feature('ppb6').set('unit', 'mol/m^3');
model.component('comp1').probe('pdom1').feature('ppb6').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb6').set('descr', 'c_s_surf_pos_min');
model.component('comp1').probe('pdom1').feature('ppb6').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb6').set('window', 'window7');
model.component('comp1').probe('pdom1').feature('ppb7').label('Point Probe Expression 5');
model.component('comp1').probe('pdom1').feature('ppb7').set('probename', 'ppb5');
model.component('comp1').probe('pdom1').feature('ppb7').set('expr', 'minop1(liion.epsl)');
model.component('comp1').probe('pdom1').feature('ppb7').set('unit', '1');
model.component('comp1').probe('pdom1').feature('ppb7').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb7').set('descr', 'epsl_neg_min');
model.component('comp1').probe('pdom1').feature('ppb7').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb7').set('window', 'window9');
model.component('comp1').probe('pdom1').feature('ppb8').label('Point Probe Expression 6');
model.component('comp1').probe('pdom1').feature('ppb8').set('probename', 'ppb6');
model.component('comp1').probe('pdom1').feature('ppb8').set('expr', 'minop1(c_s_max_neg - liion.cs_surface)');
model.component('comp1').probe('pdom1').feature('ppb8').set('unit', 'mol/m^3');
model.component('comp1').probe('pdom1').feature('ppb8').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb8').set('descr', 'c_s_max_neg-liion.cs_surface');
model.component('comp1').probe('pdom1').feature('ppb8').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb8').set('window', 'window9');
model.component('comp1').probe('pdom1').feature('ppb9').label('Point Probe Expression 7');
model.component('comp1').probe('pdom1').feature('ppb9').set('probename', 'ppb7');
model.component('comp1').probe('pdom1').feature('ppb9').set('expr', 'minop2(c_s_max_pos - liion.cs_surface)');
model.component('comp1').probe('pdom1').feature('ppb9').set('unit', 'mol/m^3');
model.component('comp1').probe('pdom1').feature('ppb9').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb9').set('descr', 'c_s_max_pos-liion.cs_surface');
model.component('comp1').probe('pdom1').feature('ppb9').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb9').set('window', 'window7');
model.component('comp1').probe('pdom1').feature('ppb10').label('Point Probe Expression 8');
model.component('comp1').probe('pdom1').feature('ppb10').set('probename', 'ppb8');
model.component('comp1').probe('pdom1').feature('ppb10').set('expr', 'minop3(cl)');
model.component('comp1').probe('pdom1').feature('ppb10').set('unit', 'mol/m^3');
model.component('comp1').probe('pdom1').feature('ppb10').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb10').set('descr', 'cl_min');
model.component('comp1').probe('pdom1').feature('ppb10').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb10').set('window', 'window7');
model.component('comp1').probe('pdom1').feature('ppb11').label('Point Probe Expression 9');
model.component('comp1').probe('pdom1').feature('ppb11').set('probename', 'ppb9');
model.component('comp1').probe('pdom1').feature('ppb11').set('expr', 'minop2(liion.epss)');
model.component('comp1').probe('pdom1').feature('ppb11').set('unit', '1');
model.component('comp1').probe('pdom1').feature('ppb11').set('descractive', true);
model.component('comp1').probe('pdom1').feature('ppb11').set('descr', 'epss_pos_min');
model.component('comp1').probe('pdom1').feature('ppb11').set('table', 'tbl1');
model.component('comp1').probe('pdom1').feature('ppb11').set('window', 'window9');

model.component('comp1').physics('liion').feature('ice1').set('Dl_mat', 'from_mat');
model.component('comp1').physics('liion').feature('pce1').set('Dl_mat', 'from_mat');
model.component('comp1').physics('liion').feature('pce2').set('Dl_mat', 'from_mat');

model.study.create('std8');
model.study('std8').create('time', 'Transient');
model.study('std8').create('time1', 'Transient');
model.study('std8').create('time2', 'Transient');
model.study('std8').create('time3', 'Transient');
model.study('std8').create('time17', 'Transient');
model.study('std8').create('time4', 'Transient');
model.study('std8').create('time5', 'Transient');
model.study('std8').create('time6', 'Transient');
model.study('std8').create('time7', 'Transient');
model.study('std8').create('time18', 'Transient');
model.study('std8').create('time8', 'Transient');
model.study('std8').create('time9', 'Transient');
model.study('std8').create('time10', 'Transient');
model.study('std8').create('time11', 'Transient');
model.study('std8').create('time19', 'Transient');
model.study('std8').create('time12', 'Transient');
model.study('std8').create('time13', 'Transient');
model.study('std8').feature('time').set('useadvanceddisable', true);
model.study('std8').feature('time').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time').set('disabledvariables', {'var26' 'var27'});
model.study('std8').feature('time1').set('useadvanceddisable', true);
model.study('std8').feature('time1').set('disabledphysics', {'liion/ecd1' 'liion/ecd2' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time1').set('disabledvariables', {'var26' 'var27'});
model.study('std8').feature('time2').set('useadvanceddisable', true);
model.study('std8').feature('time2').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time3').set('useadvanceddisable', true);
model.study('std8').feature('time3').set('disabledphysics', {'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time3').set('disabledvariables', {'var26' 'var27'});
model.study('std8').feature('time17').set('useadvanceddisable', true);
model.study('std8').feature('time17').set('disabledphysics', {'liion/ecd1' 'liion/ecd2' 'liion/ecd3' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time17').set('disabledvariables', {'var26' 'var27'});
model.study('std8').feature('time4').set('useadvanceddisable', true);
model.study('std8').feature('time4').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time5').set('useadvanceddisable', true);
model.study('std8').feature('time5').set('disabledphysics', {'liion/ecd1' 'liion/ecd2' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time6').set('useadvanceddisable', true);
model.study('std8').feature('time6').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time6').set('disabledvariables', {'var26' 'var27'});
model.study('std8').feature('time7').set('useadvanceddisable', true);
model.study('std8').feature('time7').set('disabledphysics', {'liion/ecd1' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time18').set('useadvanceddisable', true);
model.study('std8').feature('time18').set('disabledphysics', {'liion/ecd1' 'liion/ecd2' 'liion/ecd3' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time8').set('useadvanceddisable', true);
model.study('std8').feature('time8').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time9').set('useadvanceddisable', true);
model.study('std8').feature('time9').set('disabledphysics', {'liion/ecd1' 'liion/ecd2' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time10').set('useadvanceddisable', true);
model.study('std8').feature('time10').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time11').set('useadvanceddisable', true);
model.study('std8').feature('time11').set('disabledphysics', {'liion/ecd1' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time19').set('useadvanceddisable', true);
model.study('std8').feature('time19').set('disabledphysics', {'liion/ecd1' 'liion/ecd2' 'liion/ecd3' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time12').set('useadvanceddisable', true);
model.study('std8').feature('time12').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std8').feature('time13').set('useadvanceddisable', true);
model.study('std8').feature('time13').set('disabledphysics', {'liion/ecd1' 'liion/ecd2' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study.create('std9');
model.study('std9').create('time14', 'Transient');
model.study('std9').create('time15', 'Transient');
model.study('std9').create('time16', 'Transient');
model.study('std9').feature('time14').set('useadvanceddisable', true);
model.study('std9').feature('time14').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std9').feature('time15').set('useadvanceddisable', true);
model.study('std9').feature('time15').set('disabledphysics', {'liion/ecd1' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std9').feature('time16').set('useadvanceddisable', true);
model.study('std9').feature('time16').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});
model.study('std9').feature('time16').set('disabledvariables', {'var26' 'var27'});
model.study.create('std10');
model.study('std10').create('time1', 'Transient');
model.study('std10').feature('time1').set('useadvanceddisable', true);
model.study('std10').feature('time1').set('disabledphysics', {'liion/ecd2' 'liion/ecd3' 'liion/pot1' 'liion/pot2' 'liion/pot3'});

model.sol.create('sol26');
model.sol('sol26').study('std8');
model.sol('sol26').attach('std8');
model.sol('sol26').create('st1', 'StudyStep');
model.sol('sol26').create('v1', 'Variables');
model.sol('sol26').create('t1', 'Time');
model.sol('sol26').create('su1', 'StoreSolution');
model.sol('sol26').create('st2', 'StudyStep');
model.sol('sol26').create('v2', 'Variables');
model.sol('sol26').create('t2', 'Time');
model.sol('sol26').create('su2', 'StoreSolution');
model.sol('sol26').create('st3', 'StudyStep');
model.sol('sol26').create('v3', 'Variables');
model.sol('sol26').create('t3', 'Time');
model.sol('sol26').create('su3', 'StoreSolution');
model.sol('sol26').create('st4', 'StudyStep');
model.sol('sol26').create('v4', 'Variables');
model.sol('sol26').create('t4', 'Time');
model.sol('sol26').create('su4', 'StoreSolution');
model.sol('sol26').create('st5', 'StudyStep');
model.sol('sol26').create('v5', 'Variables');
model.sol('sol26').create('t5', 'Time');
model.sol('sol26').create('su5', 'StoreSolution');
model.sol('sol26').create('st6', 'StudyStep');
model.sol('sol26').create('v6', 'Variables');
model.sol('sol26').create('t6', 'Time');
model.sol('sol26').create('su6', 'StoreSolution');
model.sol('sol26').create('st7', 'StudyStep');
model.sol('sol26').create('v7', 'Variables');
model.sol('sol26').create('t7', 'Time');
model.sol('sol26').create('su7', 'StoreSolution');
model.sol('sol26').create('st8', 'StudyStep');
model.sol('sol26').create('v8', 'Variables');
model.sol('sol26').create('t8', 'Time');
model.sol('sol26').create('su8', 'StoreSolution');
model.sol('sol26').create('st9', 'StudyStep');
model.sol('sol26').create('v9', 'Variables');
model.sol('sol26').create('t9', 'Time');
model.sol('sol26').create('su9', 'StoreSolution');
model.sol('sol26').create('st10', 'StudyStep');
model.sol('sol26').create('v10', 'Variables');
model.sol('sol26').create('t10', 'Time');
model.sol('sol26').create('su10', 'StoreSolution');
model.sol('sol26').create('st11', 'StudyStep');
model.sol('sol26').create('v11', 'Variables');
model.sol('sol26').create('t11', 'Time');
model.sol('sol26').create('su11', 'StoreSolution');
model.sol('sol26').create('st12', 'StudyStep');
model.sol('sol26').create('v12', 'Variables');
model.sol('sol26').create('t12', 'Time');
model.sol('sol26').create('su12', 'StoreSolution');
model.sol('sol26').create('st13', 'StudyStep');
model.sol('sol26').create('v13', 'Variables');
model.sol('sol26').create('t13', 'Time');
model.sol('sol26').create('su13', 'StoreSolution');
model.sol('sol26').create('st14', 'StudyStep');
model.sol('sol26').create('v14', 'Variables');
model.sol('sol26').create('t14', 'Time');
model.sol('sol26').create('su14', 'StoreSolution');
model.sol('sol26').create('st15', 'StudyStep');
model.sol('sol26').create('v15', 'Variables');
model.sol('sol26').create('t15', 'Time');
model.sol('sol26').create('su15', 'StoreSolution');
model.sol('sol26').create('st16', 'StudyStep');
model.sol('sol26').create('v16', 'Variables');
model.sol('sol26').create('t16', 'Time');
model.sol('sol26').create('su16', 'StoreSolution');
model.sol('sol26').create('st17', 'StudyStep');
model.sol('sol26').create('v17', 'Variables');
model.sol('sol26').create('t17', 'Time');
model.sol('sol26').create('su17', 'StoreSolution');
model.sol('sol26').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t1').create('d1', 'Direct');
model.sol('sol26').feature('t1').feature.remove('fcDef');
model.sol('sol26').feature('t2').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t2').create('d1', 'Direct');
model.sol('sol26').feature('t2').create('st1', 'StopCondition');
model.sol('sol26').feature('t2').feature.remove('fcDef');
model.sol('sol26').feature('t3').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t3').create('d1', 'Direct');
model.sol('sol26').feature('t3').feature.remove('fcDef');
model.sol('sol26').feature('t4').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t4').create('d1', 'Direct');
model.sol('sol26').feature('t4').create('st1', 'StopCondition');
model.sol('sol26').feature('t4').feature.remove('fcDef');
model.sol('sol26').feature('t5').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t5').create('d1', 'Direct');
model.sol('sol26').feature('t5').create('st1', 'StopCondition');
model.sol('sol26').feature('t5').feature.remove('fcDef');
model.sol('sol26').feature('t6').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t6').create('d1', 'Direct');
model.sol('sol26').feature('t6').feature.remove('fcDef');
model.sol('sol26').feature('t7').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t7').create('d1', 'Direct');
model.sol('sol26').feature('t7').create('st1', 'StopCondition');
model.sol('sol26').feature('t7').feature.remove('fcDef');
model.sol('sol26').feature('t8').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t8').create('d1', 'Direct');
model.sol('sol26').feature('t8').feature.remove('fcDef');
model.sol('sol26').feature('t9').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t9').create('d1', 'Direct');
model.sol('sol26').feature('t9').create('st1', 'StopCondition');
model.sol('sol26').feature('t9').feature.remove('fcDef');
model.sol('sol26').feature('t10').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t10').create('d1', 'Direct');
model.sol('sol26').feature('t10').create('st1', 'StopCondition');
model.sol('sol26').feature('t10').feature.remove('fcDef');
model.sol('sol26').feature('t11').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t11').create('d1', 'Direct');
model.sol('sol26').feature('t11').feature.remove('fcDef');
model.sol('sol26').feature('t12').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t12').create('d1', 'Direct');
model.sol('sol26').feature('t12').create('st1', 'StopCondition');
model.sol('sol26').feature('t12').feature.remove('fcDef');
model.sol('sol26').feature('t13').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t13').create('d1', 'Direct');
model.sol('sol26').feature('t13').feature.remove('fcDef');
model.sol('sol26').feature('t14').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t14').create('d1', 'Direct');
model.sol('sol26').feature('t14').create('st1', 'StopCondition');
model.sol('sol26').feature('t14').feature.remove('fcDef');
model.sol('sol26').feature('t15').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t15').create('d1', 'Direct');
model.sol('sol26').feature('t15').create('st1', 'StopCondition');
model.sol('sol26').feature('t15').feature.remove('fcDef');
model.sol('sol26').feature('t16').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t16').create('d1', 'Direct');
model.sol('sol26').feature('t16').feature.remove('fcDef');
model.sol('sol26').feature('t17').create('fc1', 'FullyCoupled');
model.sol('sol26').feature('t17').create('d1', 'Direct');
model.sol('sol26').feature('t17').create('st1', 'StopCondition');
model.sol('sol26').feature('t17').feature.remove('fcDef');
model.sol.create('sol44');
model.sol('sol44').study('std9');
model.sol('sol44').attach('std9');
model.sol('sol44').create('st1', 'StudyStep');
model.sol('sol44').create('v1', 'Variables');
model.sol('sol44').create('t1', 'Time');
model.sol('sol44').create('su1', 'StoreSolution');
model.sol('sol44').create('st2', 'StudyStep');
model.sol('sol44').create('v2', 'Variables');
model.sol('sol44').create('t2', 'Time');
model.sol('sol44').create('su2', 'StoreSolution');
model.sol('sol44').create('st3', 'StudyStep');
model.sol('sol44').create('v3', 'Variables');
model.sol('sol44').create('t3', 'Time');
model.sol('sol44').create('su3', 'StoreSolution');
model.sol('sol44').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol44').feature('t1').create('d1', 'Direct');
model.sol('sol44').feature('t1').feature.remove('fcDef');
model.sol('sol44').feature('t2').create('fc1', 'FullyCoupled');
model.sol('sol44').feature('t2').create('d1', 'Direct');
model.sol('sol44').feature('t2').feature.remove('fcDef');
model.sol('sol44').feature('t3').create('fc1', 'FullyCoupled');
model.sol('sol44').feature('t3').create('d1', 'Direct');
model.sol('sol44').feature('t3').feature.remove('fcDef');
model.sol.create('sol48');
model.sol('sol48').study('std10');
model.sol('sol48').attach('std10');
model.sol('sol48').create('st1', 'StudyStep');
model.sol('sol48').create('v1', 'Variables');
model.sol('sol48').create('t1', 'Time');
model.sol('sol48').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol48').feature('t1').create('d1', 'Direct');
model.sol('sol48').feature('t1').feature.remove('fcDef');

model.result.dataset.create('dset69', 'Solution');
model.result.dataset.create('dset71', 'Solution');
model.result.dataset.create('dset72', 'Solution');
model.result.dataset.create('dset73', 'Solution');
model.result.dataset.create('dset74', 'Solution');
model.result.dataset.create('dset75', 'Solution');
model.result.dataset.create('dset76', 'Solution');
model.result.dataset.create('dset77', 'Solution');
model.result.dataset.create('dset78', 'Solution');
model.result.dataset.create('dset79', 'Solution');
model.result.dataset.create('dset80', 'Solution');
model.result.dataset.create('dset81', 'Solution');
model.result.dataset.create('dset82', 'Solution');
model.result.dataset.create('dset83', 'Solution');
model.result.dataset.create('dset84', 'Solution');
model.result.dataset.create('dset85', 'Solution');
model.result.dataset.create('dset86', 'Solution');
model.result.dataset.create('dset87', 'Solution');
model.result.dataset.create('dset88', 'Solution');
model.result.dataset.create('dset89', 'Solution');
model.result.dataset.create('dset90', 'Solution');
model.result.dataset.create('dset91', 'Solution');
model.result.dataset.create('dset92', 'Solution');
model.result.dataset.create('dset93', 'Solution');
model.result.dataset.create('dset94', 'Solution');
model.result.dataset.create('cpt1', 'CutPoint1D');
model.result.dataset('dset6').set('solution', 'none');
model.result.dataset('dset7').set('solution', 'none');
model.result.dataset('dset8').set('solution', 'none');
model.result.dataset('dset9').set('solution', 'none');
model.result.dataset('dset10').set('solution', 'none');
model.result.dataset('dset12').set('solution', 'none');
model.result.dataset('dset13').set('solution', 'none');
model.result.dataset('dset14').set('solution', 'none');
model.result.dataset('dset15').set('solution', 'none');
model.result.dataset('dset16').set('solution', 'none');
model.result.dataset('dset17').set('solution', 'none');
model.result.dataset('dset18').set('solution', 'none');
model.result.dataset('dset19').set('solution', 'none');
model.result.dataset('dset20').set('solution', 'none');
model.result.dataset('dset21').set('solution', 'none');
model.result.dataset('dset69').set('solution', 'none');
model.result.dataset('dset72').set('solution', 'sol27');
model.result.dataset('dset73').set('solution', 'sol28');
model.result.dataset('dset74').set('solution', 'sol29');
model.result.dataset('dset75').set('solution', 'sol30');
model.result.dataset('dset76').set('solution', 'sol31');
model.result.dataset('dset77').set('solution', 'sol32');
model.result.dataset('dset78').set('solution', 'sol33');
model.result.dataset('dset79').set('solution', 'sol34');
model.result.dataset('dset80').set('solution', 'sol35');
model.result.dataset('dset81').set('solution', 'sol36');
model.result.dataset('dset82').set('solution', 'sol37');
model.result.dataset('dset83').set('solution', 'sol38');
model.result.dataset('dset84').set('solution', 'sol39');
model.result.dataset('dset85').set('solution', 'sol40');
model.result.dataset('dset86').set('solution', 'sol41');
model.result.dataset('dset87').set('solution', 'sol42');
model.result.dataset('dset88').set('solution', 'sol43');
model.result.dataset('dset89').set('solution', 'sol44');
model.result.dataset('dset90').set('solution', 'sol45');
model.result.dataset('dset91').set('solution', 'sol46');
model.result.dataset('dset92').set('solution', 'sol47');
model.result.dataset('dset93').set('solution', 'sol48');
model.result.dataset('dset94').set('probetag', 'pdom1');
model.result.dataset('dset94').set('solution', 'sol48');
model.result.dataset('cpt1').set('probetag', 'pdom1');
model.result.dataset('cpt1').set('data', 'dset94');
model.result.dataset.remove('dset1');
model.result.dataset.remove('dset2');
model.result.dataset.remove('dset3');
model.result.dataset.remove('dset4');
model.result.dataset.remove('dset5');
model.result.dataset.remove('dset11');
model.result.dataset.remove('dset22');
model.result.dataset.remove('dset23');
model.result.numerical.create('pev1', 'EvalPoint');
model.result.numerical.create('pev2', 'EvalPoint');
model.result.numerical.create('gev77', 'EvalGlobal');
model.result.numerical.create('pev3', 'EvalPoint');
model.result.numerical.create('pev4', 'EvalPoint');
model.result.numerical.create('pev5', 'EvalPoint');
model.result.numerical.create('pev6', 'EvalPoint');
model.result.numerical.create('pev7', 'EvalPoint');
model.result.numerical.create('pev8', 'EvalPoint');
model.result.numerical.create('pev9', 'EvalPoint');
model.result.numerical.create('pev10', 'EvalPoint');
model.result.numerical.create('pev11', 'EvalPoint');
model.result.numerical('pev1').set('probetag', 'pdom1/ppb1');
model.result.numerical('pev2').set('probetag', 'pdom1/ppb2');
model.result.numerical('gev77').set('data', 'dset93');
model.result.numerical('gev77').set('probetag', 'none');
model.result.numerical('pev3').set('probetag', 'pdom1/ppb3');
model.result.numerical('pev4').set('probetag', 'pdom1/ppb4');
model.result.numerical('pev5').set('probetag', 'pdom1/ppb5');
model.result.numerical('pev6').set('probetag', 'pdom1/ppb6');
model.result.numerical('pev7').set('probetag', 'pdom1/ppb7');
model.result.numerical('pev8').set('probetag', 'pdom1/ppb8');
model.result.numerical('pev9').set('probetag', 'pdom1/ppb9');
model.result.numerical('pev10').set('probetag', 'pdom1/ppb10');
model.result.numerical('pev11').set('probetag', 'pdom1/ppb11');
model.result.create('pg1', 'PlotGroup1D');
model.result.create('pg2', 'PlotGroup1D');
model.result.create('pg3', 'PlotGroup1D');
model.result('pg1').set('probetag', 'window7');
model.result('pg1').create('tblp1', 'Table');
model.result('pg1').feature('tblp1').set('probetag', 'pdom1/ppb1,pdom1/ppb2,pdom1/ppb3,pdom1/ppb4,pdom1/ppb5,pdom1/ppb6,pdom1/ppb9,pdom1/ppb10');
model.result('pg2').set('probetag', 'window8');
model.result('pg2').create('tblp1', 'Table');
model.result('pg2').feature('tblp1').set('probetag', 'pdom2/ppb11,pdom2/ppb12,pdom2/ppb13,pdom1/ppb12,pdom1/ppb13');
model.result('pg3').set('probetag', 'window9_default');
model.result('pg3').create('tblp1', 'Table');
model.result('pg3').feature('tblp1').set('probetag', 'pdom1/ppb7,pdom1/ppb8,pdom1/ppb11');

model.component('comp1').probe('pdom1').genResult([]);

model.study('std8').label('VW Study');
model.study('std8').feature('time').label('3h rest');
model.study('std8').feature('time').set('tlist', '3600*3');
model.study('std8').feature('time').set('usertol', true);
model.study('std8').feature('time').set('rtol', '1E-4');
model.study('std8').feature('time').set('useinitsol', true);
model.study('std8').feature('time').set('usesol', true);
model.study('std8').feature('time1').label('Loop1: CC DCH');
model.study('std8').feature('time1').set('tlist', '4000*3');
model.study('std8').feature('time1').set('usertol', true);
model.study('std8').feature('time1').set('rtol', '1E-4');
model.study('std8').feature('time1').set('useinitsol', true);
model.study('std8').feature('time1').set('initsoluse', 'sol27');
model.study('std8').feature('time1').set('solnum', 'last');
model.study('std8').feature('time1').set('usesol', true);
model.study('std8').feature('time1').set('notsoluse', 'sol27');
model.study('std8').feature('time1').set('notsolnum', 'last');
model.study('std8').feature('time2').label('Loop1: 30 min rest 1');
model.study('std8').feature('time2').set('tlist', '60*30');
model.study('std8').feature('time2').set('usertol', true);
model.study('std8').feature('time2').set('rtol', '1E-4');
model.study('std8').feature('time2').set('useinitsol', true);
model.study('std8').feature('time2').set('initsoluse', 'sol28');
model.study('std8').feature('time2').set('solnum', 'last');
model.study('std8').feature('time2').set('usesol', true);
model.study('std8').feature('time2').set('notsoluse', 'sol28');
model.study('std8').feature('time2').set('notsolnum', 'last');
model.study('std8').feature('time3').label('Loop1: CC CHA');
model.study('std8').feature('time3').set('tlist', '4000*3');
model.study('std8').feature('time3').set('usertol', true);
model.study('std8').feature('time3').set('rtol', '1E-4');
model.study('std8').feature('time3').set('useinitsol', true);
model.study('std8').feature('time3').set('initsoluse', 'sol29');
model.study('std8').feature('time3').set('solnum', 'last');
model.study('std8').feature('time3').set('usesol', true);
model.study('std8').feature('time3').set('notsoluse', 'sol29');
model.study('std8').feature('time3').set('notsolnum', 'last');
model.study('std8').feature('time17').label('Loop1: CV CHA');
model.study('std8').feature('time17').set('tlist', '4000*3');
model.study('std8').feature('time17').set('usertol', true);
model.study('std8').feature('time17').set('rtol', '1E-4');
model.study('std8').feature('time17').set('useinitsol', true);
model.study('std8').feature('time17').set('initsoluse', 'sol30');
model.study('std8').feature('time17').set('solnum', 'last');
model.study('std8').feature('time17').set('usesol', true);
model.study('std8').feature('time17').set('notsoluse', 'sol30');
model.study('std8').feature('time17').set('notsolnum', 'last');
model.study('std8').feature('time4').label('Loop1: 30 min rest 2');
model.study('std8').feature('time4').set('tlist', '60*30');
model.study('std8').feature('time4').set('usertol', true);
model.study('std8').feature('time4').set('rtol', '1E-4');
model.study('std8').feature('time4').set('useinitsol', true);
model.study('std8').feature('time4').set('initsoluse', 'sol31');
model.study('std8').feature('time4').set('solnum', 'last');
model.study('std8').feature('time4').set('usesol', true);
model.study('std8').feature('time4').set('notsoluse', 'sol31');
model.study('std8').feature('time4').set('notsolnum', 'last');
model.study('std8').feature('time5').label('Loop2: CC DCH');
model.study('std8').feature('time5').set('tlist', '4000*3');
model.study('std8').feature('time5').set('usertol', true);
model.study('std8').feature('time5').set('rtol', '1E-4');
model.study('std8').feature('time5').set('useinitsol', true);
model.study('std8').feature('time5').set('initsoluse', 'sol32');
model.study('std8').feature('time5').set('solnum', 'last');
model.study('std8').feature('time5').set('usesol', true);
model.study('std8').feature('time5').set('notsoluse', 'sol32');
model.study('std8').feature('time5').set('notsolnum', 'last');
model.study('std8').feature('time6').label('Loop2: 30 min rest 1');
model.study('std8').feature('time6').set('tlist', '60*30');
model.study('std8').feature('time6').set('usertol', true);
model.study('std8').feature('time6').set('rtol', '1E-4');
model.study('std8').feature('time6').set('useinitsol', true);
model.study('std8').feature('time6').set('initsoluse', 'sol33');
model.study('std8').feature('time6').set('solnum', 'last');
model.study('std8').feature('time6').set('usesol', true);
model.study('std8').feature('time6').set('notsoluse', 'sol33');
model.study('std8').feature('time6').set('notsolnum', 'last');
model.study('std8').feature('time7').label('Loop2: CC CHA');
model.study('std8').feature('time7').set('tlist', '4000*3');
model.study('std8').feature('time7').set('usertol', true);
model.study('std8').feature('time7').set('rtol', '1E-4');
model.study('std8').feature('time7').set('useinitsol', true);
model.study('std8').feature('time7').set('initsoluse', 'sol34');
model.study('std8').feature('time7').set('solnum', 'last');
model.study('std8').feature('time7').set('usesol', true);
model.study('std8').feature('time7').set('notsoluse', 'sol34');
model.study('std8').feature('time7').set('notsolnum', 'last');
model.study('std8').feature('time18').label('Loop2: CV CHA');
model.study('std8').feature('time18').set('tlist', '4000*3');
model.study('std8').feature('time18').set('usertol', true);
model.study('std8').feature('time18').set('rtol', '1E-4');
model.study('std8').feature('time18').set('useinitsol', true);
model.study('std8').feature('time18').set('initsoluse', 'sol35');
model.study('std8').feature('time18').set('solnum', 'last');
model.study('std8').feature('time18').set('usesol', true);
model.study('std8').feature('time18').set('notsoluse', 'sol35');
model.study('std8').feature('time18').set('notsolnum', 'last');
model.study('std8').feature('time8').label('Loop2: 30 min rest 2');
model.study('std8').feature('time8').set('tlist', '60*30');
model.study('std8').feature('time8').set('usertol', true);
model.study('std8').feature('time8').set('rtol', '1E-4');
model.study('std8').feature('time8').set('useinitsol', true);
model.study('std8').feature('time8').set('initsoluse', 'sol36');
model.study('std8').feature('time8').set('solnum', 'last');
model.study('std8').feature('time8').set('usesol', true);
model.study('std8').feature('time8').set('notsoluse', 'sol36');
model.study('std8').feature('time8').set('notsolnum', 'last');
model.study('std8').feature('time9').label('Loop3: CC DCH');
model.study('std8').feature('time9').set('tlist', '4000*3');
model.study('std8').feature('time9').set('usertol', true);
model.study('std8').feature('time9').set('rtol', '1E-4');
model.study('std8').feature('time9').set('useinitsol', true);
model.study('std8').feature('time9').set('initsoluse', 'sol37');
model.study('std8').feature('time9').set('solnum', 'last');
model.study('std8').feature('time9').set('usesol', true);
model.study('std8').feature('time9').set('notsoluse', 'sol37');
model.study('std8').feature('time9').set('notsolnum', 'last');
model.study('std8').feature('time10').label('Loop3: 30 min rest 1');
model.study('std8').feature('time10').set('tlist', '60*30');
model.study('std8').feature('time10').set('usertol', true);
model.study('std8').feature('time10').set('rtol', '1E-4');
model.study('std8').feature('time10').set('useinitsol', true);
model.study('std8').feature('time10').set('initsoluse', 'sol38');
model.study('std8').feature('time10').set('solnum', 'last');
model.study('std8').feature('time10').set('usesol', true);
model.study('std8').feature('time10').set('notsoluse', 'sol38');
model.study('std8').feature('time10').set('notsolnum', 'last');
model.study('std8').feature('time11').label('Loop3: CC CHA');
model.study('std8').feature('time11').set('tlist', '4000*3');
model.study('std8').feature('time11').set('usertol', true);
model.study('std8').feature('time11').set('rtol', '1E-4');
model.study('std8').feature('time11').set('useinitsol', true);
model.study('std8').feature('time11').set('initsoluse', 'sol39');
model.study('std8').feature('time11').set('solnum', 'last');
model.study('std8').feature('time11').set('usesol', true);
model.study('std8').feature('time11').set('notsoluse', 'sol39');
model.study('std8').feature('time11').set('notsolnum', 'last');
model.study('std8').feature('time19').label('Loop3: CV CHA');
model.study('std8').feature('time19').set('tlist', '4000*3');
model.study('std8').feature('time19').set('usertol', true);
model.study('std8').feature('time19').set('rtol', '1E-4');
model.study('std8').feature('time19').set('useinitsol', true);
model.study('std8').feature('time19').set('initsoluse', 'sol40');
model.study('std8').feature('time19').set('solnum', 'last');
model.study('std8').feature('time19').set('usesol', true);
model.study('std8').feature('time19').set('notsoluse', 'sol40');
model.study('std8').feature('time19').set('notsolnum', 'last');
model.study('std8').feature('time12').label('Loop3: 30 min rest 2');
model.study('std8').feature('time12').set('tlist', '60*30');
model.study('std8').feature('time12').set('usertol', true);
model.study('std8').feature('time12').set('rtol', '1E-4');
model.study('std8').feature('time12').set('useinitsol', true);
model.study('std8').feature('time12').set('initsoluse', 'sol41');
model.study('std8').feature('time12').set('solnum', 'last');
model.study('std8').feature('time12').set('usesol', true);
model.study('std8').feature('time12').set('notsoluse', 'sol41');
model.study('std8').feature('time12').set('notsolnum', 'last');
model.study('std8').feature('time13').label('CC DCH');
model.study('std8').feature('time13').set('tlist', '4000*3');
model.study('std8').feature('time13').set('usertol', true);
model.study('std8').feature('time13').set('rtol', '1E-6');
model.study('std8').feature('time13').set('useinitsol', true);
model.study('std8').feature('time13').set('initsoluse', 'sol42');
model.study('std8').feature('time13').set('solnum', 'last');
model.study('std8').feature('time13').set('usesol', true);
model.study('std8').feature('time13').set('notsoluse', 'sol42');
model.study('std8').feature('time13').set('notsolnum', 'last');
model.study('std9').label('VW - Charge to SOCtgt');
model.study('std9').feature('time14').label('30 min rest');
model.study('std9').feature('time14').set('tlist', '60*30');
model.study('std9').feature('time14').set('usertol', true);
model.study('std9').feature('time14').set('rtol', '1E-6');
model.study('std9').feature('time14').set('useinitsol', true);
model.study('std9').feature('time14').set('initmethod', 'sol');
model.study('std9').feature('time14').set('initstudy', 'std8');
model.study('std9').feature('time14').set('initsoluse', 'sol43');
model.study('std9').feature('time14').set('solnum', 'last');
model.study('std9').feature('time14').set('usesol', true);
model.study('std9').feature('time14').set('notsolmethod', 'sol');
model.study('std9').feature('time14').set('notstudy', 'std8');
model.study('std9').feature('time14').set('notsoluse', 'sol43');
model.study('std9').feature('time14').set('notsolnum', 'last');
model.study('std9').feature('time15').label('CC CH to SOCtarget');
model.study('std9').feature('time15').set('tlist', 't_charge');
model.study('std9').feature('time15').set('usertol', true);
model.study('std9').feature('time15').set('rtol', '1E-6');
model.study('std9').feature('time15').set('useinitsol', true);
model.study('std9').feature('time15').set('initsol', 'sol44');
model.study('std9').feature('time15').set('initsoluse', 'sol45');
model.study('std9').feature('time15').set('solnum', 'last');
model.study('std9').feature('time15').set('usesol', true);
model.study('std9').feature('time15').set('notsol', 'sol44');
model.study('std9').feature('time15').set('notsoluse', 'sol45');
model.study('std9').feature('time15').set('notsolnum', 'last');
model.study('std9').feature('time16').label('3 hr rest');
model.study('std9').feature('time16').set('tlist', '3600*3');
model.study('std9').feature('time16').set('usertol', true);
model.study('std9').feature('time16').set('rtol', '1E-4');
model.study('std9').feature('time16').set('useinitsol', true);
model.study('std9').feature('time16').set('initsol', 'sol44');
model.study('std9').feature('time16').set('initsoluse', 'sol46');
model.study('std9').feature('time16').set('solnum', 'last');
model.study('std9').feature('time16').set('usesol', true);
model.study('std9').feature('time16').set('notsol', 'sol44');
model.study('std9').feature('time16').set('notsoluse', 'sol46');
model.study('std9').feature('time16').set('notsolnum', 'last');
model.study('std10').label('VW - Storage');
model.study('std10').feature('time1').label('VW Storage');
model.study('std10').feature('time1').set('tlist', 't_storage');
model.study('std10').feature('time1').set('usertol', true);
model.study('std10').feature('time1').set('rtol', '0.0001');
model.study('std10').feature('time1').set('useinitsol', true);
model.study('std10').feature('time1').set('initmethod', 'sol');
model.study('std10').feature('time1').set('initstudy', 'std9');
model.study('std10').feature('time1').set('initsol', 'sol44');
model.study('std10').feature('time1').set('initsoluse', 'sol47');
model.study('std10').feature('time1').set('solnum', 'last');
model.study('std10').feature('time1').set('usesol', true);
model.study('std10').feature('time1').set('notsolmethod', 'sol');
model.study('std10').feature('time1').set('notstudy', 'std9');
model.study('std10').feature('time1').set('notsol', 'sol44');
model.study('std10').feature('time1').set('notsoluse', 'sol47');
model.study('std10').feature('time1').set('notsolnum', 'last');

model.sol('sol26').attach('std8');
model.sol('sol26').feature('v1').set('clist', {'0 3600*3' '10.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]'  ...
'12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v1').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v1').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v1').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v1').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v1').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v1').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v1').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v1').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t1').set('tlist', '3600*3');
model.sol('sol26').feature('t1').set('rtol', '1E-4');
model.sol('sol26').feature('t1').set('maxorder', 2);
model.sol('sol26').feature('t1').set('tout', 'tsteps');
model.sol('sol26').feature('t1').set('eventout', true);
model.sol('sol26').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('st2').set('studystep', 'time1');
model.sol('sol26').feature('v2').set('initmethod', 'sol');
model.sol('sol26').feature('v2').set('initsol', 'sol26');
model.sol('sol26').feature('v2').set('initsoluse', 'sol27');
model.sol('sol26').feature('v2').set('solnum', 'last');
model.sol('sol26').feature('v2').set('resscalemethod', 'auto');
model.sol('sol26').feature('v2').set('notsolmethod', 'sol');
model.sol('sol26').feature('v2').set('notsol', 'sol26');
model.sol('sol26').feature('v2').set('notsoluse', 'sol27');
model.sol('sol26').feature('v2').set('notsolnum', 'last');
model.sol('sol26').feature('v2').set('clist', {'0 4000*3' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]'  ...
'1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v2').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v2').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v2').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v2').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v2').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v2').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v2').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v2').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v2').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v2').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t2').set('tlist', '4000*3');
model.sol('sol26').feature('t2').set('rtol', '1E-4');
model.sol('sol26').feature('t2').set('maxorder', 2);
model.sol('sol26').feature('t2').set('tout', 'tsteps');
model.sol('sol26').feature('t2').set('eventout', true);
model.sol('sol26').feature('t2').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t2').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t2').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t2').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t2').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t2').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t2').feature('st1').set('stopcondarr', {'comp1.ppb1<= E_min'});
model.sol('sol26').feature('st3').set('studystep', 'time2');
model.sol('sol26').feature('v3').set('initmethod', 'sol');
model.sol('sol26').feature('v3').set('initsol', 'sol26');
model.sol('sol26').feature('v3').set('initsoluse', 'sol28');
model.sol('sol26').feature('v3').set('solnum', 'last');
model.sol('sol26').feature('v3').set('resscalemethod', 'auto');
model.sol('sol26').feature('v3').set('notsolmethod', 'sol');
model.sol('sol26').feature('v3').set('notsol', 'sol26');
model.sol('sol26').feature('v3').set('notsoluse', 'sol28');
model.sol('sol26').feature('v3').set('notsolnum', 'last');
model.sol('sol26').feature('v3').set('clist', {'0 60*30' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]'  ...
'12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v3').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v3').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v3').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v3').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v3').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v3').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v3').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v3').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v3').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v3').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t3').set('tlist', '60*30');
model.sol('sol26').feature('t3').set('rtol', '1E-4');
model.sol('sol26').feature('t3').set('maxorder', 2);
model.sol('sol26').feature('t3').set('tout', 'tsteps');
model.sol('sol26').feature('t3').set('eventout', true);
model.sol('sol26').feature('t3').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t3').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t3').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('st4').set('studystep', 'time3');
model.sol('sol26').feature('v4').set('initmethod', 'sol');
model.sol('sol26').feature('v4').set('initsol', 'sol26');
model.sol('sol26').feature('v4').set('initsoluse', 'sol29');
model.sol('sol26').feature('v4').set('solnum', 'last');
model.sol('sol26').feature('v4').set('resscalemethod', 'auto');
model.sol('sol26').feature('v4').set('notsolmethod', 'sol');
model.sol('sol26').feature('v4').set('notsol', 'sol26');
model.sol('sol26').feature('v4').set('notsoluse', 'sol29');
model.sol('sol26').feature('v4').set('notsolnum', 'last');
model.sol('sol26').feature('v4').set('clist', {'0 4000*3' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'  ...
'1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v4').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v4').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v4').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v4').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v4').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v4').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v4').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v4').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v4').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v4').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t4').set('tlist', '4000*3');
model.sol('sol26').feature('t4').set('rtol', '1E-4');
model.sol('sol26').feature('t4').set('maxorder', 2);
model.sol('sol26').feature('t4').set('tout', 'tsteps');
model.sol('sol26').feature('t4').set('eventout', true);
model.sol('sol26').feature('t4').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t4').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t4').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t4').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t4').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t4').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t4').feature('st1').set('stopcondarr', {'comp1.ppb1>= E_max'});
model.sol('sol26').feature('st5').set('studystep', 'time17');
model.sol('sol26').feature('v5').set('initmethod', 'sol');
model.sol('sol26').feature('v5').set('initsol', 'sol26');
model.sol('sol26').feature('v5').set('initsoluse', 'sol30');
model.sol('sol26').feature('v5').set('solnum', 'last');
model.sol('sol26').feature('v5').set('resscalemethod', 'auto');
model.sol('sol26').feature('v5').set('notsolmethod', 'sol');
model.sol('sol26').feature('v5').set('notsol', 'sol26');
model.sol('sol26').feature('v5').set('notsoluse', 'sol30');
model.sol('sol26').feature('v5').set('notsolnum', 'last');
model.sol('sol26').feature('v5').set('clist', {'0 4000*3' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]'  ...
'12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v5').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v5').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v5').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v5').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v5').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v5').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v5').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v5').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v5').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v5').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t5').set('tlist', '4000*3');
model.sol('sol26').feature('t5').set('rtol', '1E-4');
model.sol('sol26').feature('t5').set('maxorder', 2);
model.sol('sol26').feature('t5').set('tout', 'tsteps');
model.sol('sol26').feature('t5').set('eventout', true);
model.sol('sol26').feature('t5').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t5').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t5').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t5').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t5').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t5').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t5').feature('st1').set('stopcondarr', {'abs(comp1.ppb2) <= CUT_OFF_CURRENT'});
model.sol('sol26').feature('st6').set('studystep', 'time4');
model.sol('sol26').feature('v6').set('initmethod', 'sol');
model.sol('sol26').feature('v6').set('initsol', 'sol26');
model.sol('sol26').feature('v6').set('initsoluse', 'sol31');
model.sol('sol26').feature('v6').set('solnum', 'last');
model.sol('sol26').feature('v6').set('resscalemethod', 'auto');
model.sol('sol26').feature('v6').set('notsolmethod', 'sol');
model.sol('sol26').feature('v6').set('notsol', 'sol26');
model.sol('sol26').feature('v6').set('notsoluse', 'sol31');
model.sol('sol26').feature('v6').set('notsolnum', 'last');
model.sol('sol26').feature('v6').set('clist', {'0 60*30' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]'  ...
'12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v6').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v6').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v6').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v6').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v6').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v6').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v6').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v6').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v6').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v6').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t6').set('tlist', '60*30');
model.sol('sol26').feature('t6').set('rtol', '1E-4');
model.sol('sol26').feature('t6').set('maxorder', 2);
model.sol('sol26').feature('t6').set('tout', 'tsteps');
model.sol('sol26').feature('t6').set('eventout', true);
model.sol('sol26').feature('t6').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t6').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t6').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('st7').set('studystep', 'time5');
model.sol('sol26').feature('v7').set('initmethod', 'sol');
model.sol('sol26').feature('v7').set('initsol', 'sol26');
model.sol('sol26').feature('v7').set('initsoluse', 'sol32');
model.sol('sol26').feature('v7').set('solnum', 'last');
model.sol('sol26').feature('v7').set('resscalemethod', 'auto');
model.sol('sol26').feature('v7').set('notsolmethod', 'sol');
model.sol('sol26').feature('v7').set('notsol', 'sol26');
model.sol('sol26').feature('v7').set('notsoluse', 'sol32');
model.sol('sol26').feature('v7').set('notsolnum', 'last');
model.sol('sol26').feature('v7').set('clist', {'0 4000*3' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]'  ...
'1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v7').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v7').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v7').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v7').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v7').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v7').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v7').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v7').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v7').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v7').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t7').set('tlist', '4000*3');
model.sol('sol26').feature('t7').set('rtol', '1E-4');
model.sol('sol26').feature('t7').set('maxorder', 2);
model.sol('sol26').feature('t7').set('tout', 'tsteps');
model.sol('sol26').feature('t7').set('eventout', true);
model.sol('sol26').feature('t7').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t7').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t7').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t7').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t7').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t7').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t7').feature('st1').set('stopcondarr', {'comp1.ppb1<= E_min'});
model.sol('sol26').feature('st8').set('studystep', 'time6');
model.sol('sol26').feature('v8').set('initmethod', 'sol');
model.sol('sol26').feature('v8').set('initsol', 'sol26');
model.sol('sol26').feature('v8').set('initsoluse', 'sol33');
model.sol('sol26').feature('v8').set('solnum', 'last');
model.sol('sol26').feature('v8').set('resscalemethod', 'auto');
model.sol('sol26').feature('v8').set('notsolmethod', 'sol');
model.sol('sol26').feature('v8').set('notsol', 'sol26');
model.sol('sol26').feature('v8').set('notsoluse', 'sol33');
model.sol('sol26').feature('v8').set('notsolnum', 'last');
model.sol('sol26').feature('v8').set('clist', {'0 60*30' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]'  ...
'12.0[s]'});
model.sol('sol26').feature('v8').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v8').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v8').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v8').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v8').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v8').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v8').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v8').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v8').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v8').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t8').set('tlist', '60*30');
model.sol('sol26').feature('t8').set('rtol', '1E-4');
model.sol('sol26').feature('t8').set('maxorder', 2);
model.sol('sol26').feature('t8').set('tout', 'tsteps');
model.sol('sol26').feature('t8').set('eventout', true);
model.sol('sol26').feature('t8').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t8').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t8').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('st9').set('studystep', 'time7');
model.sol('sol26').feature('v9').set('initmethod', 'sol');
model.sol('sol26').feature('v9').set('initsol', 'sol26');
model.sol('sol26').feature('v9').set('initsoluse', 'sol34');
model.sol('sol26').feature('v9').set('solnum', 'last');
model.sol('sol26').feature('v9').set('resscalemethod', 'auto');
model.sol('sol26').feature('v9').set('notsolmethod', 'sol');
model.sol('sol26').feature('v9').set('notsol', 'sol26');
model.sol('sol26').feature('v9').set('notsoluse', 'sol34');
model.sol('sol26').feature('v9').set('notsolnum', 'last');
model.sol('sol26').feature('v9').set('clist', {'0 4000*3' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v9').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v9').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v9').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v9').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v9').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v9').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v9').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v9').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v9').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v9').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t9').set('tlist', '4000*3');
model.sol('sol26').feature('t9').set('rtol', '1E-4');
model.sol('sol26').feature('t9').set('maxorder', 2);
model.sol('sol26').feature('t9').set('tout', 'tsteps');
model.sol('sol26').feature('t9').set('eventout', true);
model.sol('sol26').feature('t9').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t9').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t9').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t9').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t9').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t9').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t9').feature('st1').set('stopcondarr', {'comp1.ppb1>= E_max'});
model.sol('sol26').feature('st10').set('studystep', 'time18');
model.sol('sol26').feature('v10').set('initmethod', 'sol');
model.sol('sol26').feature('v10').set('initsol', 'sol26');
model.sol('sol26').feature('v10').set('initsoluse', 'sol35');
model.sol('sol26').feature('v10').set('solnum', 'last');
model.sol('sol26').feature('v10').set('resscalemethod', 'auto');
model.sol('sol26').feature('v10').set('notsolmethod', 'sol');
model.sol('sol26').feature('v10').set('notsol', 'sol26');
model.sol('sol26').feature('v10').set('notsoluse', 'sol35');
model.sol('sol26').feature('v10').set('notsolnum', 'last');
model.sol('sol26').feature('v10').set('clist', {'0 4000*3' '12.0[s]' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v10').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v10').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v10').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v10').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v10').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v10').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v10').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v10').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v10').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v10').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t10').set('tlist', '4000*3');
model.sol('sol26').feature('t10').set('rtol', '1E-4');
model.sol('sol26').feature('t10').set('maxorder', 2);
model.sol('sol26').feature('t10').set('tout', 'tsteps');
model.sol('sol26').feature('t10').set('eventout', true);
model.sol('sol26').feature('t10').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t10').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t10').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t10').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t10').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t10').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t10').feature('st1').set('stopcondarr', {'abs(comp1.ppb2) <= CUT_OFF_CURRENT'});
model.sol('sol26').feature('st11').set('studystep', 'time8');
model.sol('sol26').feature('v11').set('initmethod', 'sol');
model.sol('sol26').feature('v11').set('initsol', 'sol26');
model.sol('sol26').feature('v11').set('initsoluse', 'sol36');
model.sol('sol26').feature('v11').set('solnum', 'last');
model.sol('sol26').feature('v11').set('resscalemethod', 'auto');
model.sol('sol26').feature('v11').set('notsolmethod', 'sol');
model.sol('sol26').feature('v11').set('notsol', 'sol26');
model.sol('sol26').feature('v11').set('notsoluse', 'sol36');
model.sol('sol26').feature('v11').set('notsolnum', 'last');
model.sol('sol26').feature('v11').set('clist', {'0 60*30' '1.8[s]' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v11').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v11').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v11').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v11').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v11').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v11').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v11').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v11').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v11').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v11').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t11').set('tlist', '60*30');
model.sol('sol26').feature('t11').set('rtol', '1E-4');
model.sol('sol26').feature('t11').set('maxorder', 2);
model.sol('sol26').feature('t11').set('tout', 'tsteps');
model.sol('sol26').feature('t11').set('eventout', true);
model.sol('sol26').feature('t11').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t11').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t11').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('st12').set('studystep', 'time9');
model.sol('sol26').feature('v12').set('initmethod', 'sol');
model.sol('sol26').feature('v12').set('initsol', 'sol26');
model.sol('sol26').feature('v12').set('initsoluse', 'sol37');
model.sol('sol26').feature('v12').set('solnum', 'last');
model.sol('sol26').feature('v12').set('resscalemethod', 'auto');
model.sol('sol26').feature('v12').set('notsolmethod', 'sol');
model.sol('sol26').feature('v12').set('notsol', 'sol26');
model.sol('sol26').feature('v12').set('notsoluse', 'sol37');
model.sol('sol26').feature('v12').set('notsolnum', 'last');
model.sol('sol26').feature('v12').set('clist', {'0 4000*3' '12.0[s]' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v12').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v12').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v12').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v12').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v12').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v12').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v12').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v12').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v12').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v12').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t12').set('tlist', '4000*3');
model.sol('sol26').feature('t12').set('rtol', '1E-4');
model.sol('sol26').feature('t12').set('maxorder', 2);
model.sol('sol26').feature('t12').set('tout', 'tsteps');
model.sol('sol26').feature('t12').set('eventout', true);
model.sol('sol26').feature('t12').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t12').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t12').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t12').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t12').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t12').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t12').feature('st1').set('stopcondarr', {'comp1.ppb1<= E_min'});
model.sol('sol26').feature('st13').set('studystep', 'time10');
model.sol('sol26').feature('v13').set('initmethod', 'sol');
model.sol('sol26').feature('v13').set('initsol', 'sol26');
model.sol('sol26').feature('v13').set('initsoluse', 'sol38');
model.sol('sol26').feature('v13').set('solnum', 'last');
model.sol('sol26').feature('v13').set('resscalemethod', 'auto');
model.sol('sol26').feature('v13').set('notsolmethod', 'sol');
model.sol('sol26').feature('v13').set('notsol', 'sol26');
model.sol('sol26').feature('v13').set('notsoluse', 'sol38');
model.sol('sol26').feature('v13').set('notsolnum', 'last');
model.sol('sol26').feature('v13').set('clist', {'0 60*30' '1.8[s]' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v13').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v13').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v13').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v13').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v13').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v13').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v13').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v13').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v13').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v13').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t13').set('tlist', '60*30');
model.sol('sol26').feature('t13').set('rtol', '1E-4');
model.sol('sol26').feature('t13').set('maxorder', 2);
model.sol('sol26').feature('t13').set('tout', 'tsteps');
model.sol('sol26').feature('t13').set('eventout', true);
model.sol('sol26').feature('t13').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t13').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t13').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('st14').set('studystep', 'time11');
model.sol('sol26').feature('v14').set('initmethod', 'sol');
model.sol('sol26').feature('v14').set('initsol', 'sol26');
model.sol('sol26').feature('v14').set('initsoluse', 'sol39');
model.sol('sol26').feature('v14').set('solnum', 'last');
model.sol('sol26').feature('v14').set('resscalemethod', 'auto');
model.sol('sol26').feature('v14').set('notsolmethod', 'sol');
model.sol('sol26').feature('v14').set('notsol', 'sol26');
model.sol('sol26').feature('v14').set('notsoluse', 'sol39');
model.sol('sol26').feature('v14').set('notsolnum', 'last');
model.sol('sol26').feature('v14').set('clist', {'0 4000*3' '12.0[s]' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v14').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v14').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v14').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v14').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v14').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v14').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v14').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v14').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v14').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v14').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t14').set('tlist', '4000*3');
model.sol('sol26').feature('t14').set('rtol', '1E-4');
model.sol('sol26').feature('t14').set('maxorder', 2);
model.sol('sol26').feature('t14').set('tout', 'tsteps');
model.sol('sol26').feature('t14').set('eventout', true);
model.sol('sol26').feature('t14').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t14').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t14').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t14').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t14').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t14').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t14').feature('st1').set('stopcondarr', {'comp1.ppb1>= E_max'});
model.sol('sol26').feature('st15').set('studystep', 'time19');
model.sol('sol26').feature('v15').set('initmethod', 'sol');
model.sol('sol26').feature('v15').set('initsol', 'sol26');
model.sol('sol26').feature('v15').set('initsoluse', 'sol40');
model.sol('sol26').feature('v15').set('solnum', 'last');
model.sol('sol26').feature('v15').set('resscalemethod', 'auto');
model.sol('sol26').feature('v15').set('notsolmethod', 'sol');
model.sol('sol26').feature('v15').set('notsol', 'sol26');
model.sol('sol26').feature('v15').set('notsoluse', 'sol40');
model.sol('sol26').feature('v15').set('notsolnum', 'last');
model.sol('sol26').feature('v15').set('clist', {'0 4000*3' '12.0[s]' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v15').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v15').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v15').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v15').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v15').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v15').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v15').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v15').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v15').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v15').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t15').set('tlist', '4000*3');
model.sol('sol26').feature('t15').set('rtol', '1E-4');
model.sol('sol26').feature('t15').set('maxorder', 2);
model.sol('sol26').feature('t15').set('tout', 'tsteps');
model.sol('sol26').feature('t15').set('eventout', true);
model.sol('sol26').feature('t15').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t15').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t15').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t15').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t15').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t15').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t15').feature('st1').set('stopcondarr', {'abs(comp1.ppb2) <= CUT_OFF_CURRENT'});
model.sol('sol26').feature('st16').set('studystep', 'time12');
model.sol('sol26').feature('v16').set('initmethod', 'sol');
model.sol('sol26').feature('v16').set('initsol', 'sol26');
model.sol('sol26').feature('v16').set('initsoluse', 'sol41');
model.sol('sol26').feature('v16').set('solnum', 'last');
model.sol('sol26').feature('v16').set('resscalemethod', 'auto');
model.sol('sol26').feature('v16').set('notsolmethod', 'sol');
model.sol('sol26').feature('v16').set('notsol', 'sol26');
model.sol('sol26').feature('v16').set('notsoluse', 'sol41');
model.sol('sol26').feature('v16').set('notsolnum', 'last');
model.sol('sol26').feature('v16').set('clist', {'0 60*30' '1.8[s]' '12.0[s]'});
model.sol('sol26').feature('v16').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v16').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v16').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v16').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v16').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v16').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v16').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v16').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v16').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v16').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t16').set('tlist', '60*30');
model.sol('sol26').feature('t16').set('rtol', '1E-4');
model.sol('sol26').feature('t16').set('maxorder', 2);
model.sol('sol26').feature('t16').set('tout', 'tsteps');
model.sol('sol26').feature('t16').set('eventout', true);
model.sol('sol26').feature('t16').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t16').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t16').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('st17').set('studystep', 'time13');
model.sol('sol26').feature('v17').set('initmethod', 'sol');
model.sol('sol26').feature('v17').set('initsol', 'sol26');
model.sol('sol26').feature('v17').set('initsoluse', 'sol42');
model.sol('sol26').feature('v17').set('solnum', 'last');
model.sol('sol26').feature('v17').set('resscalemethod', 'auto');
model.sol('sol26').feature('v17').set('notsolmethod', 'sol');
model.sol('sol26').feature('v17').set('notsol', 'sol26');
model.sol('sol26').feature('v17').set('notsoluse', 'sol42');
model.sol('sol26').feature('v17').set('notsolnum', 'last');
model.sol('sol26').feature('v17').set('clist', {'0 4000*3' '12.0[s]'});
model.sol('sol26').feature('v17').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol26').feature('v17').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol26').feature('v17').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v17').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol26').feature('v17').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol26').feature('v17').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol26').feature('v17').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol26').feature('v17').feature('comp1_phil').set('scaleval', 1);
model.sol('sol26').feature('v17').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol26').feature('v17').feature('comp1_phis').set('scaleval', 1);
model.sol('sol26').feature('t17').set('tlist', '4000*3');
model.sol('sol26').feature('t17').set('rtol', '1E-6');
model.sol('sol26').feature('t17').set('maxorder', 2);
model.sol('sol26').feature('t17').set('tout', 'tsteps');
model.sol('sol26').feature('t17').set('eventout', true);
model.sol('sol26').feature('t17').feature('aDef').set('cachepattern', true);
model.sol('sol26').feature('t17').feature('fc1').set('dtech', 'auto');
model.sol('sol26').feature('t17').feature('fc1').set('maxiter', 5);
model.sol('sol26').feature('t17').feature('st1').set('stopcondterminateon', {'true'});
model.sol('sol26').feature('t17').feature('st1').set('stopcondActive', {'on'});
model.sol('sol26').feature('t17').feature('st1').set('stopconddesc', {'Stop expression 1'});
model.sol('sol26').feature('t17').feature('st1').set('stopcondarr', {'comp1.ppb1<= E_min'});
model.sol('sol26').runAll;
model.sol('sol44').attach('std9');
model.sol('sol44').feature('v1').set('initmethod', 'sol');
model.sol('sol44').feature('v1').set('initsol', 'sol26');
model.sol('sol44').feature('v1').set('initsoluse', 'sol43');
model.sol('sol44').feature('v1').set('solnum', 'last');
model.sol('sol44').feature('v1').set('notsolmethod', 'sol');
model.sol('sol44').feature('v1').set('notsol', 'sol26');
model.sol('sol44').feature('v1').set('notsoluse', 'sol43');
model.sol('sol44').feature('v1').set('notsolnum', 'last');
model.sol('sol44').feature('v1').set('clist', {'0 60*30' '1.8[s]' '11.608959924985111[s]' '10.8[s]'});
model.sol('sol44').feature('v1').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol44').feature('v1').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol44').feature('v1').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol44').feature('v1').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol44').feature('v1').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol44').feature('v1').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol44').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol44').feature('v1').feature('comp1_phil').set('scaleval', 1);
model.sol('sol44').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol44').feature('v1').feature('comp1_phis').set('scaleval', 1);
model.sol('sol44').feature('t1').set('tlist', '60*30');
model.sol('sol44').feature('t1').set('rtol', '1E-6');
model.sol('sol44').feature('t1').set('maxorder', 2);
model.sol('sol44').feature('t1').set('tout', 'tsteps');
model.sol('sol44').feature('t1').set('eventout', true);
model.sol('sol44').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol44').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol44').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol44').feature('st2').set('studystep', 'time15');
model.sol('sol44').feature('v2').set('initmethod', 'sol');
model.sol('sol44').feature('v2').set('initsol', 'sol44');
model.sol('sol44').feature('v2').set('initsoluse', 'sol45');
model.sol('sol44').feature('v2').set('solnum', 'last');
model.sol('sol44').feature('v2').set('notsolmethod', 'sol');
model.sol('sol44').feature('v2').set('notsol', 'sol44');
model.sol('sol44').feature('v2').set('notsoluse', 'sol45');
model.sol('sol44').feature('v2').set('notsolnum', 'last');
model.sol('sol44').feature('v2').set('clist', {'0 t_charge' '11.608959924985111[s]' '10.8[s]'});
model.sol('sol44').feature('v2').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol44').feature('v2').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol44').feature('v2').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol44').feature('v2').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol44').feature('v2').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol44').feature('v2').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol44').feature('v2').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol44').feature('v2').feature('comp1_phil').set('scaleval', 1);
model.sol('sol44').feature('v2').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol44').feature('v2').feature('comp1_phis').set('scaleval', 1);
model.sol('sol44').feature('t2').set('tlist', 't_charge');
model.sol('sol44').feature('t2').set('rtol', '1E-6');
model.sol('sol44').feature('t2').set('maxorder', 2);
model.sol('sol44').feature('t2').set('tout', 'tsteps');
model.sol('sol44').feature('t2').set('eventout', true);
model.sol('sol44').feature('t2').feature('aDef').set('cachepattern', true);
model.sol('sol44').feature('t2').feature('fc1').set('dtech', 'auto');
model.sol('sol44').feature('t2').feature('fc1').set('maxiter', 5);
model.sol('sol44').feature('st3').set('studystep', 'time16');
model.sol('sol44').feature('v3').set('initmethod', 'sol');
model.sol('sol44').feature('v3').set('initsol', 'sol44');
model.sol('sol44').feature('v3').set('initsoluse', 'sol46');
model.sol('sol44').feature('v3').set('solnum', 'last');
model.sol('sol44').feature('v3').set('notsolmethod', 'sol');
model.sol('sol44').feature('v3').set('notsol', 'sol44');
model.sol('sol44').feature('v3').set('notsoluse', 'sol46');
model.sol('sol44').feature('v3').set('notsolnum', 'last');
model.sol('sol44').feature('v3').set('clist', {'0 3600*3' '10.8[s]'});
model.sol('sol44').feature('v3').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol44').feature('v3').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol44').feature('v3').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol44').feature('v3').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol44').feature('v3').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol44').feature('v3').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol44').feature('v3').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol44').feature('v3').feature('comp1_phil').set('scaleval', 1);
model.sol('sol44').feature('v3').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol44').feature('v3').feature('comp1_phis').set('scaleval', 1);
model.sol('sol44').feature('t3').set('tlist', '3600*3');
model.sol('sol44').feature('t3').set('rtol', '1E-4');
model.sol('sol44').feature('t3').set('maxorder', 2);
model.sol('sol44').feature('t3').set('tout', 'tsteps');
model.sol('sol44').feature('t3').set('eventout', true);
model.sol('sol44').feature('t3').feature('aDef').set('cachepattern', true);
model.sol('sol44').feature('t3').feature('fc1').set('dtech', 'auto');
model.sol('sol44').feature('t3').feature('fc1').set('maxiter', 5);
model.sol('sol44').runAll;
model.sol('sol48').attach('std10');
model.sol('sol48').feature('v1').set('initmethod', 'sol');
model.sol('sol48').feature('v1').set('initsol', 'sol44');
model.sol('sol48').feature('v1').set('initsoluse', 'sol47');
model.sol('sol48').feature('v1').set('solnum', 'last');
model.sol('sol48').feature('v1').set('notsolmethod', 'sol');
model.sol('sol48').feature('v1').set('notsol', 'sol44');
model.sol('sol48').feature('v1').set('notsoluse', 'sol47');
model.sol('sol48').feature('v1').set('notsolnum', 'last');
model.sol('sol48').feature('v1').set('clist', {'0 t_storage' '2592.0[s]'});
model.sol('sol48').feature('v1').feature('comp1_cl').set('scalemethod', 'manual');
model.sol('sol48').feature('v1').feature('comp1_cl').set('scaleval', 1000);
model.sol('sol48').feature('v1').feature('comp1_liion_pce1_cs').set('scalemethod', 'manual');
model.sol('sol48').feature('v1').feature('comp1_liion_pce1_cs').set('scaleval', 10000);
model.sol('sol48').feature('v1').feature('comp1_liion_pce2_cs').set('scalemethod', 'manual');
model.sol('sol48').feature('v1').feature('comp1_liion_pce2_cs').set('scaleval', 10000);
model.sol('sol48').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol48').feature('v1').feature('comp1_phil').set('scaleval', 1);
model.sol('sol48').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol48').feature('v1').feature('comp1_phis').set('scaleval', 1);
model.sol('sol48').feature('t1').set('tlist', 't_storage');
model.sol('sol48').feature('t1').set('rtol', '0.0001');
model.sol('sol48').feature('t1').set('maxorder', 2);
model.sol('sol48').feature('t1').set('tout', 'tsteps');
model.sol('sol48').feature('t1').set('eventout', true);
model.sol('sol48').feature('t1').feature('aDef').set('cachepattern', true);
model.sol('sol48').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol48').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol48').runAll;

model.result.dataset('dset94').label('Probe Solution 94');
model.result.dataset('dset94').set('frametype', 'spatial');
model.result.dataset('cpt1').set('data', 'dset94');
model.result.dataset.remove('dset95');
model.result.numerical('gev77').set('expr', {'E_cell' 'I_cell' 'delta_SEI_avg' 'cl_avg' 'soc_neg_avg' 'soc_neg_surf' 'soc_pos_avg' 'soc_pos_surf' 'U_neg_avg' 'U_neg_surf'  ...
'U_pos_avg' 'U_pos_surf' 'epss_pos_avg' 'epsl_pos_avg' 'Q' 'a_s_neg_avg' 'epsl_neg_avg'});
model.result.numerical('gev77').set('unit', {'V' 'A' 'm' 'mol/m^3' '1' '1' '1' '1' '' ''  ...
'' '' '1' '1' 'C' '1/m' '1'});
model.result.numerical('gev77').set('descr', {'E_cell' 'I_cell' 'delta_SEI_avg' 'cl_avg' 'soc_neg_avg' 'soc_neg_surf' 'soc_pos_avg' 'soc_pos_surf' 'U_neg_avg' 'U_neg_surf'  ...
'U_pos_avg' 'U_pos_surf' 'epss_pos_avg' 'epsl_pos_avg' 'Q' 'a_s_neg_avg' 'epsl_neg_avg'});
model.result.numerical('pev3').label('Point Probe Expression 3.1');
model.result.numerical('pev3').set('data', 'cpt1');
model.result.numerical('pev3').set('solrepresentation', 'solutioninfo');
model.result.numerical('pev3').set('looplevelinput', {'all'});
model.result.numerical('pev3').set('table', 'tbl1');
model.result.numerical('pev3').set('expr', {'maxop1(liion.cs_surface)'});
model.result.numerical('pev3').set('unit', {'mol/m^3'});
model.result.numerical('pev4').label('Point Probe Expression 4.1');
model.result.numerical('pev4').set('data', 'cpt1');
model.result.numerical('pev4').set('solrepresentation', 'solutioninfo');
model.result.numerical('pev4').set('looplevelinput', {'all'});
model.result.numerical('pev4').set('table', 'tbl1');
model.result.numerical('pev4').set('expr', {'maxop2(liion.cs_surface)'});
model.result.numerical('pev4').set('unit', {'mol/m^3'});
model.result.numerical('pev5').label('Point Probe Expression 3.2');
model.result.numerical('pev6').label('Point Probe Expression 4.2');
model.result.numerical('pev1').setResult;
model.result.numerical('pev2').appendResult;
model.result.numerical('pev5').appendResult;
model.result.numerical('pev6').appendResult;
model.result.numerical('pev7').appendResult;
model.result.numerical('pev8').appendResult;
model.result.numerical('pev9').appendResult;
model.result.numerical('pev10').appendResult;
model.result.numerical('pev11').appendResult;
model.result('pg1').label('Probe Plot Group 1');
model.result('pg1').set('xlabel', 'Time (s)');
model.result('pg1').set('windowtitle', 'Probe Plot 7');
model.result('pg1').set('xlabelactive', false);
model.result('pg1').feature('tblp1').label('Probe Table Graph 1');
model.result('pg1').feature('tblp1').set('legend', true);
model.result('pg2').label('Probe Plot Group 2');
model.result('pg2').set('data', 'none');
model.result('pg2').set('xlabel', 'Time (s)');
model.result('pg2').set('window', 'window8');
model.result('pg2').set('windowtitle', 'Probe Plot 8');
model.result('pg2').set('xlabelactive', false);
model.result('pg2').feature('tblp1').label('Probe Table Graph 1');
model.result('pg2').feature('tblp1').set('plotcolumninput', 'manual');
model.result('pg2').feature('tblp1').set('legend', true);
model.result('pg3').label('Probe Plot Group 3');
model.result('pg3').set('xlabel', 'Time (s)');
model.result('pg3').set('windowtitle', 'Probe Plot 9');
model.result('pg3').set('xlabelactive', false);
model.result('pg3').feature('tblp1').label('Probe Table Graph 1');
model.result('pg3').feature('tblp1').set('legend', true);

model.label('calendar_aging5_lambda5_probe.mph');

model.component('comp1').variable('var34').set('i0_cl', '(cl/1[mol/m^3])^0.5');
model.component('comp1').variable('var34').set('i0_cmax', '((c_s_max_neg-liion.cs_surface)/1[mol/m^3])^0.5');
model.component('comp1').variable('var34').set('i0_cs', '(liion.cs_surface/1[mol/m^3])^0.5');
model.component('comp1').variable('var34').set('i0', 'k_neg[mol/m^2/s]*i0_cl*i0_cs*i0_cmax*F_const');
model.component('comp1').variable('var35').set('i0_cl', '(cl/1[mol/m^3])^0.5');
model.component('comp1').variable('var35').descr('i0_cl', '');
model.component('comp1').variable('var35').set('i0_cmax', '((c_s_max_neg-liion.cs_surface)/1[mol/m^3])^0.5');
model.component('comp1').variable('var35').descr('i0_cmax', '');
model.component('comp1').variable('var35').set('i0_cs', '(liion.cs_surface/1[mol/m^3])^0.5');
model.component('comp1').variable('var35').descr('i0_cs', '');
model.component('comp1').variable('var35').set('i0_cmax', '((c_s_max_pos-liion.cs_surface)/1[mol/m^3])^0.5');
model.component('comp1').variable('var35').set('i0', 'k_pos[mol/m^2/s]*i0_cl*i0_cs*i0_cmax*F_const');

model.label('calendar_aging_vw_lambda_constLi_probe.mph');

model.param.set('theta100_neg', '0.98');

model.label('calendar_aging_vw_lambda_constLi_probe.mph');

model.component('comp1').variable('var34').set('i0_cmax', 'if(c_s_max_neg<=liion.cs_surface,0,((c_s_max_neg-liion.cs_surface)/1[mol/m^3])^0.5)');

model.label('calendar_aging_vw_lambda_constLi_probe.mph');

model.component('comp1').probe('pdom1').feature.remove('ppb9');
model.component('comp1').probe('pdom1').feature.remove('ppb10');
model.component('comp1').probe('pdom1').feature.remove('ppb11');

model.label('calendar_aging_final.mph');

model.component('comp1').variable('var33').set('eta_diss', 'phis-phil-E_diss');

model.label('calendar_aging_final.mph');

model.param.descr('A_cell', '');
model.param.descr('a_s_neg0', '');
model.param.descr('a_s_pos0', '');
model.param.descr('alpha_a_neg', '');
model.param.descr('alpha_a_pos', '');
model.param.descr('alpha_c_H2', '');
model.param.descr('alpha_c_neg', '');
model.param.descr('alpha_c_pos', '');
model.param.descr('alpha_c_SEI', '');
model.param.descr('c_e0', '');
model.param.descr('c_EC0', '');
model.param.descr('c_s_max_neg', '');
model.param.descr('c_s0_neg', '');
model.param.descr('c_s_max_pos', '');
model.param.descr('c_s0_pos', '');
model.param.descr('d_cell', '');
model.param.remove('d_cell');
model.param.descr('D_s_neg', '');
model.param.descr('D_s_pos', '');
model.param.descr('Dis_1C', '');
model.param.descr('dlnf_dlnc', '');
model.param.remove('dlnf_dlnc');
model.param.descr('Ea_kf', '');
model.param.descr('Ea_kLi', '');
model.param.descr('Ea_kneg', '');
model.param.descr('Ea_kpos', '');
model.param.descr('Ea_SEI', '');
model.param.descr('epsilon_e_neg0', '');
model.param.descr('epsilon_e_pos0', '');
model.param.descr('epsilon_e_sep', '');
model.param.descr('epsilon_f_neg', '');
model.param.descr('epsilon_f_pos', '');
model.param.descr('epsilon_s_neg0', '');
model.param.descr('k0_neg', '');
model.param.descr('k0_pos', '');
model.param.descr('kappa_s_neg', '');
model.param.descr('kappa_s_pos', '');
model.param.descr('L_neg', '');
model.param.descr('L_pos', '');
model.param.descr('L_sep', '');
model.param.descr('M_SEI', '');
model.param.descr('pBrug_s', '');
model.param.descr('pBrug', '');
model.param.descr('r_p_neg', '');
model.param.descr('r_p_pos', '');
model.param.descr('SOC', '');
model.param.descr('rho_SEI', '');
model.param.descr('soc0_neg', '');
model.param.descr('soc0_pos', '');
model.param.descr('T', '');
model.param.descr('t_charge', '');
model.param.descr('t_plus0', '');
model.param.descr('T_ref', '');

out = model;
