function varargout = fixed(varargin)
% FIXED MATLAB code for fixed.fig
%      FIXED, by itself, creates a new FIXED or raises the existing
%      singleton*.
%
%      H = FIXED returns the handle to a new FIXED or the handle to
%      the existing singleton*.
%
%      FIXED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIXED.M with the given input arguments.
%
%      FIXED('Property','Value',...) creates a new FIXED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fixed_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fixed_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fixed

% Last Modified by GUIDE v2.5 06-Jan-2025 16:28:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fixed_OpeningFcn, ...
                   'gui_OutputFcn',  @fixed_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before fixed is made visible.
function fixed_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fixed (see VARARGIN)
% Update handles structure
guidata(hObject, handles);
cla reset;
box on; %在坐标轴四周加上边框
set(handles.axes1,'xtick',[]);
set(handles.axes1,'ytick',[]);

set(handles.axes5,'xtick',[]);
set(handles.axes5,'ytick',[]);

%%初始化
   handles.original_img = [];
   handles.processed_img = [];
   guidata(hObject, handles);  % 保存 handles 结构体

% Choose default command line output for fixed
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fixed wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fixed_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        [file, path] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files'});
        if isequal(file, 0)
            return;
        end
        handles.original_img = imread(fullfile(path, file));
        handles.processed_img = handles.original_img;
        imshow(handles.processed_img, 'Parent', handles.axes1);
        set(handles.text1, 'String', path);
        guidata(hObject, handles);  % 保存 handles 结构体


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.processed_img)
   msgbox('请打开要进行操作的图片！', '错误', 'error');  % 弹出错误提示框
    return;
end
handles.processed_img = imgaussfilt(handles.processed_img, 2);
imshow(handles.processed_img, 'Parent', handles.axes1);
guidata(hObject, handles);  % 保存 handles 结构体

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.original_img)
    msgbox('请打开要进行操作的图片！', '错误', 'error');  % 弹出错误提示框
    return;
end

    handles.processed_img = im2gray(handles.processed_img);
    imshow(handles.processed_img, 'Parent', handles.axes1);
    guidata(hObject, handles);  % 保存 handles 结构体

    handles.processed_img = imadjust(handles.processed_img);
    imshow(handles.processed_img, 'Parent', handles.axes1);
    guidata(hObject, handles);  % 保存 handles 结构体

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.original_img)
           msgbox('没有图片可以重置！', '错误', 'error');  % 弹出错误提示框
            return;
end
handles.processed_img = handles.original_img;
imshow(handles.processed_img, 'Parent', handles.axes1);
guidata(hObject, handles);  % 保存 handles 结构体

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
if isempty(handles.processed_img)
           msgbox('请打开要进行操作的图片！', '错误', 'error');  % 弹出错误提示框
            return;
end
handles.processed_img = fliplr(handles.processed_img);
imshow(handles.processed_img, 'Parent', handles.axes1);
guidata(hObject, handles);  % 保存 handles 结构体

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
if isempty(handles.processed_img)
           msgbox('请打开要进行操作的图片！', '错误', 'error');  % 弹出错误提示框
            return;
end
handles.processed_img = imrotate(handles.processed_img, 90);
imshow(handles.processed_img, 'Parent', handles.axes1);
guidata(hObject, handles);  % 保存 handles 结构体

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.processed_img)
           msgbox('请打开要进行操作的图片！', '错误', 'error');  % 弹出错误提示框
            return;
end
handles.processed_img = im2gray(handles.processed_img);
imshow(handles.processed_img, 'Parent', handles.axes1);
guidata(hObject, handles);  % 保存 handles 结构体

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);
%% 初始化
handles.original_img = [];  % 清空原始图像
handles.processed_img = [];  % 清空处理过的图像

imshow([], 'Parent', handles.axes1);  % 清空axes1中的图像
imshow([], 'Parent', handles.axes5);  % 清空axes1中的图像
% 清除其他可能的控件值，比如文本框、标签等

set(handles.text10, 'String', '0');  % 清空原始图像的文本框


% 更新 handles 结构体

box on; %在坐标轴四周加上边框
set(handles.axes1,'xtick',[]);
set(handles.axes1,'ytick',[]);

box on; %在坐标轴四周加上边框
set(handles.axes5,'xtick',[]);
set(handles.axes5,'ytick',[]);

%%初始化
   handles.original_img = [];
   handles.processed_img = [];
   guidata(hObject, handles);  % 保存 handles 结构体


% --- Executes during object creation, after setting all properties.
function pushbutton15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
    % 获取popupmenu2的选项
    filterType = get(handles.popupmenu2, 'Value');
    
    % 读取当前图像
    img = handles.processed_img; % 假设你已经加载了图像到handles.img
    
    % 确保图像类型一致
    img = im2double(img);
    yuan=im2double(handles.original_img);
    
    % 根据选择的滤波类型进行操作
    switch filterType
        case 1  % 均值滤波
            filteredImg = imfilter(img, fspecial('average', 3)); % 使用3x3的均值滤波器
        case 2  % 中值滤波
            filteredImg = medfilt2(img, [3 3]); % 使用3x3的中值滤波器
        case 3  % 高斯低通滤波
            filteredImg = imgaussfilt(img, 2); % 高斯滤波，2为标准差
        case 4  % 巴特沃斯低通滤波
            filteredImg = butterworth_lowpass_filter(img, 30,2); % 需要定义巴特沃斯滤波函数
        case 5  % 小波变换
            filteredImg = im2double(wavelet_denoise(img)); % 小波去噪
        case 6  % 维纳变换
            filteredImg = wiener2(img, [5 5]); % 5x5的维纳滤波器
        case 7  % DCT变换
            sigma = 0.25; % 噪声标准差
            threshold = 2 * sigma; % 阈值，设定为噪声的2倍
            filteredImg = DCT_denoising(img, threshold); % DCT去噪

        otherwise
            errordlg('请选择一个有效的滤波器!');
            return;
    end
    
    % 显示滤波后的图像到axes5
    axes(handles.axes5);
    imshow(filteredImg);
    
    % 计算峰值信噪比（PSNR）
    psnrValue = psnr(filteredImg, yuan); % 计算PSNR，原图与滤波后的图像
    set(handles.text10, 'String', ['PSNR: ', num2str(psnrValue)]); % 将PSNR显示在text10中


function denoised_image = wavelet_denoise(input_image)
    % 使用小波包分解进行图像去噪
    [C, S] = wavedec2(input_image, 3, 'db1');  % 使用Daubechies小波进行3层小波分解
    
    % 阈值去噪：使用软阈值方法进行去噪
    threshold = 0.02 * max(abs(C));  % 设置阈值，这里选择阈值为系数的0.2倍
    C_denoised = sign(C) .* max(abs(C) - threshold, 0);  % 软阈值去噪
    
    % 重构图像
    denoised_image = waverec2(C_denoised, S, 'db1');  % 小波重构


function filteredImg = DCT_denoising(input_image, threshold)
    % 对输入图像进行DCT变换
    dct_image = dct2(input_image);  % 对图像进行二维DCT变换
    
    % 去除小于阈值的DCT系数
    dct_image(abs(dct_image) < threshold) = 0;
    
    % 进行逆DCT变换
    filteredImg = idct2(dct_image);
function output_image = butterworth_lowpass_filter(input_image, D0, n)
    % 输入参数：
    % input_image: 输入的图像（灰度图）
    % D0: 截止频率（决定滤波器的频率范围）
    % n: 滤波器的阶数（决定滤波器的陡峭程度）
    
    % 获取图像的尺寸
    [M, N] = size(input_image);
    
    % 将图像转换到频域（傅里叶变换）
    f_input = fftshift(fft2(input_image));  % 快速傅里叶变换并且中心化
    
    % 创建频率坐标系
    [u, v] = meshgrid(-floor(N/2):floor(N/2)-1, -floor(M/2):floor(M/2)-1);
    D = sqrt(u.^2 + v.^2);  % 计算每个点到频域中心的距离
    
    % 创建巴特沃斯低通滤波器
    H = 1 ./ (1 + (D / D0).^(2 * n));  % 巴特沃斯滤波器的频率响应函数
    
    % 应用巴特沃斯低通滤波器到频域图像
    f_output = f_input .* H;
    
    % 将滤波后的频域图像转换回空域（逆傅里叶变换）
    output_image = real(ifft2(ifftshift(f_output)));  % 逆傅里叶变换并去除虚部
   


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
    % 读取popupmenu4的选择项
    noiseType = get(handles.popupmenu4, 'Value');  % 获取选择的噪声类型

    % 读取当前处理后的图像
    img = handles.processed_img;

    % 根据选择的噪声类型添加噪声
    switch noiseType
        case 1  % 高斯噪声
            % 添加高斯噪声，均值为0，标准差为0.1
            noisyImg = imnoise(img, 'gaussian', 0, 0.01);
            
        case 2  % 椒盐噪声
            % 添加椒盐噪声，噪声密度为0.05
            noisyImg = imnoise(img, 'salt & pepper', 0.05);
            
        case 3  % 乘性噪声
            % 添加乘性噪声，乘性噪声标准差为0.2
            noisyImg = imnoise(img, 'multiplicative', 0.2);
            
        otherwise
            errordlg('请选择一个有效的噪声类型!');
            return;
    end

    % 将添加噪声后的图像保存到handles.processed_img中
    handles.processed_img = noisyImg;

    % 更新handles结构
    guidata(hObject, handles);

    % 显示添加噪声后的图像到axes5
    axes(handles.axes1);
    imshow(noisyImg);
