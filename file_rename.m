function varargout = file_rename(varargin)

%           M = file_rename(file_ext, start_ind, name)
%               file_ext = file extension ('.pdf', '.xmr', ....)
%               start_ind = start index (integer)
%               name = first part of filename (text) - optional  


pathname_source = uigetdir('*','Please select the source folder...');
pathname_dest = uigetdir('*','Please select the destination folder...');
file_ext = varargin{1};
start_ind = varargin{2};

Mdir = dir(pathname_source);
nbentries = size(Mdir,1);
k = 1;

for entry_i = 1:nbentries
    if Mdir(entry_i).isdir == false
        filename = Mdir(entry_i).name;
        if filename(1) ~= '.'
            [~,~,ext] = fileparts(filename);
            if strcmpi(ext,file_ext)
                Mfiles{k} = char(filename);
                [~,Mnames{k},~] = fileparts(filename);
                k = k + 1;
            end
        end
    end
end

nbfiles = size(Mfiles,2);

if nargin == 2
    for n = 1:nbfiles
        movefile(strcat(pathname_source,'/',Mfiles{n}), strcat(pathname_dest,'/',sprintf('%u',(n+start_ind)-1),file_ext))
    end
end

if nargin == 3
    name = varargin{3};
    for n = 1:nbfiles
        movefile(strcat(pathname_source,'/',Mfiles{n}), strcat(pathname_dest,'/',name,'_',sprintf('%u',(n+start_ind)-1),file_ext))
    end
end

varargout{1} = 'Done!';

end
