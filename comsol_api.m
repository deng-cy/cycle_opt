function out=comsol_api(dict,restart)
% load comsol model
global model
import com.comsol.model.util.*

warning('off','all');
zero_cycle=isempty(model) || (exist('restart', 'var') && restart);

if zero_cycle
    model = mphload('calendar_aging_final.mph');
end

% disp(dict)
dict_struct = struct(dict);
fn = fieldnames(dict_struct);

storage_time = 30; % Unit is in days
t_storage = storage_time*24*60*60; % Unit is in seconds

for k=1:numel(fn)
     model.param.set(fn{k}, dict_struct.(fn{k}));
end
    model.param.set('t_storage', sprintf('%i [s]', t_storage));
    
        % Set VW LOOP to obtain values from STORAGE solution
        model.study('std8').feature('time').set('useinitsol', true);
        model.study('std8').feature('time').set('initmethod', 'sol');
        model.study('std8').feature('time').set('initstudy', 'std10');
        model.study('std8').feature('time').set('solnum', 'last');

        model.study('std8').feature('time').set('usesol', true);
        model.study('std8').feature('time').set('notsolmethod', 'sol');
        model.study('std8').feature('time').set('notstudy', 'std10');
        model.study('std8').feature('time').set('notsolnum', 'last');

if zero_cycle
        model.param.set('SOC', '0.1');
        
        % Set VW LOOP to obtain values from ZERO solution
        model.study('std8').feature('time').set('useinitsol', true);
        model.study('std8').feature('time').set('initmethod', 'init');
        model.study('std8').feature('time').set('initstudy', 'zero');

        model.study('std8').feature('time').set('usesol', true);
        model.study('std8').feature('time').set('notsolmethod', 'init');
        model.study('std8').feature('time').set('notstudy', 'zero');

        % Run VW LOOP
        model.param.set('T', "25+273.15[K]");
        model.sol('sol26').runAll;
        
        % Post-process to obtain C_ocv
        CT_Q = mphglobal(model, 'Q', 'dataset', 'dset88');
        C_ocv = abs(CT_Q(end)-CT_Q(1)); % Q in C
        
        % Set C_ocv in order to obatain t_charge for SOC target
        model.param.set('C_ocv', sprintf('%i [C]', C_ocv)); % Necessary to decide charging time ('t_charge')

        % Run SET SOC TARGET for next storage cycle
        model.sol('sol44').runAll;

        % Discharge capacity from 1st VW LOOP
        CT_Q = mphglobal(model, 'Q', 'dataset', 'dset73');
        Q = abs(CT_Q(end)-CT_Q(1)); % Q in C
        Q0_DCH_CC_Ah1 = Q/3600; % Q in Ah
        
        % Discharge capacity from 2nd VW LOOP
        CT_Q = mphglobal(model, 'Q', 'dataset', 'dset78');
        Q = abs(CT_Q(end)-CT_Q(1)); % Q in C
        Q0_DCH_CC_Ah2 = Q/3600; % Q in Ah
        
        % Discharge capacity from 3rd VW LOOP
        CT_Q = mphglobal(model, 'Q', 'dataset', 'dset83');
        Q = abs(CT_Q(end)-CT_Q(1)); % Q in C
        Q0_DCH_CC_Ah3 = Q/3600; % Q in Ah       
        
        Q_DCH_Ah = C_ocv/3600;
else
        % Run STORAGE
        model.sol('sol48').runAll;

        % Set to room temperature prior to VW LOOP
        model.param.set('T', "25+273.15[K]");

        % Running VW Loop Study to find C_ocv
        model.sol('sol26').runAll;
        
        % Post-process to obtain C_ocv
        CT_Q = mphglobal(model, 'Q', 'dataset', 'dset88');
        C_ocv = abs(CT_Q(end)-CT_Q(1)); % Q in C
        
        % Set C_ocv in order to obatain t_charge for SOC target
        model.param.set('C_ocv', sprintf('%i [C]', C_ocv)); % Necessary to decide charging time ('t_charge')

        % Run SET SOC TARGET for next storage cycle
        model.sol('sol44').runAll;
        
        % Discharge capacity from 1st loop
        CT_Q = mphglobal(model, 'Q', 'dataset', 'dset73');
        Q = abs(CT_Q(end)-CT_Q(1)); % Q in C
        Q0_DCH_CC_Ah1 = Q/3600; % Q in Ah
        
        % Discharge capacity from 2nd loop
        CT_Q = mphglobal(model, 'Q', 'dataset', 'dset78');
        Q = abs(CT_Q(end)-CT_Q(1)); % Q in C
        Q0_DCH_CC_Ah2 = Q/3600; % Q in Ah
        
        % Discharge capacity from 3rd loop
        CT_Q = mphglobal(model, 'Q', 'dataset', 'dset83');
        Q = abs(CT_Q(end)-CT_Q(1)); % Q in C
        Q0_DCH_CC_Ah3 = Q/3600; % Q in Ah
        
        % C_ocv
        Q_DCH_Ah=(C_ocv)/3600;
        
end
      

out=Q_DCH_Ah;
end