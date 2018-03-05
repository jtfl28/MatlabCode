function neuralAI(obj,type,wavelet)

if exist('neuron.mat') > 0
    load('neuron.mat','neuron');
    age = 'old';
elseif exist('neuron.mat') == 0
    prompt = 'There is no Neuron file in the same dirrectory as this fuction, would you like to start a new one? (y/n)';
    response = input(prompt, 's');
    while response ~= 'n' && response ~='y'
        prompt = 'Please enter a valid response. (y/n)';
        response = input(prompt, 's');
    end
    if response == 'y'
        age = 'new';
        neuron = {};
        save('neuron.mat','neuron','-v6');
    elseif response == 'n'
        return;
    end
end
            

if isempty(wavelet)|| strcmp(wavelet,'haart2')
    [a,h,v,d] = haart2(obj);
else
    [a,h,v,d] = haart2(obj); %for now, plan on adding the other wavelt methods later
end
    

if strcmp(age,'old') && isempty(neuron) == 0
    h_current = neuron([1,2],:);
    v_current = neuron([3,4],:);
    d_current = neuron([5,6],:);
else
    h_current = {};
    v_current = {};
    d_current = {};
end


dec = 5; %number of dec used to approx
amount_of_dendrites = 7;

if type == 'feed'
%     matrix_size = [size(h{1,1},1),size(v{1,1},1),size(d{1,1},1);size(h{1,1},2),size(v{1,1},2),size(d{1,1},2)];
    %the horizontal aspects
    matrix_size = size(h{1,1});
    current_neuron(1,1:amount_of_dendrites) = {randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size)};                
    while(isinacell(current_neuron(1,:),fix(h{1,1})) == [0,0])
        [m,n] = size(h_current);
        current_neuron(1,1:amount_of_dendrites) = {randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size),randi([min(min(fix(h{1,1}))) max(max(fix(h{1,1})))],matrix_size)};                
        h_current(1,n+1) = {current_neuron};
    end
%     
%     for j = 1:dec
%         [~,index] = isinacell(current_neuron,fix(h{1,1}));
%     end
        

end    


% initial_dendrite = randi(max(matrix_values(1,:)),max(matrix_values(:,1)));

% i = 1;
% neuron = initial_dendrite;

% while(max(ismember(initial_dendrite,fix(a))) == 0)
%     i = i+1;
%     initial_dendrite = randi(max(matrix_values(1,:)),max(matrix_values(:,1)));
%     neuron = [neuron, initial_dendrite];
% end


end

