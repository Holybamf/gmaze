% ncvarlongname List variables long name of a netcdf object
%
% [long_namelist var_name_list] = ncvarlongname(nc)
% 
% Give back the list of long names of all variables of the netcdf object nc.
% If no output are requested, simply display the list on screen.
%
% Created: 2009-12-02.
% Rev. by Guillaume Maze on 2011-03-07: Improved outputs
% Copyright (c) 2009, Guillaume Maze (Laboratoire de Physique des Oceans).
% All rights reserved.
% http://codes.guillaumemaze.org

% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 	* Redistributions of source code must retain the above copyright notice, this list of 
% 	conditions and the following disclaimer.
% 	* Redistributions in binary form must reproduce the above copyright notice, this list 
% 	of conditions and the following disclaimer in the documentation and/or other materials 
% 	provided with the distribution.
% 	* Neither the name of the Laboratoire de Physique des Oceans nor the names of its contributors may be used 
%	to endorse or promote products derived from this software without specific prior 
%	written permission.
%
% THIS SOFTWARE IS PROVIDED BY Guillaume Maze ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, 
% INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
% PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Guillaume Maze BE LIABLE FOR ANY 
% DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
% LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
% BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
% STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%

function varargout = ncvarlongname(varargin)

nc = varargin{1};
if ~isa(nc,'netcdf')
	error('ncvarname only take as argument a netcdf object')
end

v = var(nc);
for iv = 1 : length(v)
%	namelist(iv) = {nc{name(v{iv})}.long_name(:)};
	namelist_disp(iv) = {sprintf('%20s: %s',name(v{iv}),nc{name(v{iv})}.long_name(:))};
	namelist0(iv) = {name(v{iv})};
	namelistIO(iv) = {nc{name(v{iv})}.long_name(:)};
	if isempty(nc{name(v{iv})}.long_name(:))
		namelistIO(iv) = {''}; % Set to empty string, allow to use intersect on the output
	end% if
end
[namelist0 is] = sort(namelist0);
namelist_disp = namelist_disp(is);
namelistIO    = namelistIO(is);

switch nargout
	case 0
		for iv=1:length(namelist_disp)
			disp(namelist_disp{iv})
		end% for iv
	case 1
		varargout(1) = {namelistIO};
	case 2
		varargout(1) = {namelistIO};
		varargout(2) = {namelist0};
		
end% switch 



end %functionncvarlongname