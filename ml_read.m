function [m_set,m_indic,m_size] = ml_read(path,option,u_size,v_size)
    if(nargin==1)
		option=0;
        u_size=6040;
        v_size=3952;
    end
    



% movie_lens reader is specificlly for this data set
    fid=fopen(path,'r+','native','UTF-8');  % open dat file with utf-8 dataset
    data_in_row=textscan(fid,'%d %d %d %d'); % scan from the raw file
    m_set=transpose(cell2mat(data_in_row)); % transpose it for later iteration    
    % close the file
    fclose(fid);

    if(option)
    	m_size=length(m_set);
    	[m_set,m_indic]=tab2mat(m_set,u_size,v_size);
    end
end


function [mat,indic]=tab2mat(tab,u,i)
	mat=zeros(u,i); % a matrix to store observed rank value
	indic=zeros(u,i); % an indicator matrix
	for row=tab
		mat(row(1),row(2))=double(row(3));
		indic(row(1),row(2))=1;
	end
end