%% Lauren Franz final project
% This script was written by Lauren Franz on December 11th, 2021.
% This script runs a font-color matching Stroop Color and Word test.
clear all
close all
clc

scrn = get(0, 'screensize'); %getting the screensize for the figure window
left = scrn(1);
bottom = scrn(2);
width = scrn(3);
height = scrn(4);

f1 = figure(1); %figure window for test
set(f1, 'menubar', 'none');
set(f1, 'position', [left, bottom, width, height]); %Positioned to fill the screen


% Start screen text
% title text
h(1)=uicontrol('units', 'normalized', 'style', 'text', 'position', [.35 .85 .28 .1],...
    'string', 'Stroop Color and Word Test', 'fontsize', 25); 
%keyboard reminder
h2=uicontrol('units', 'normalized', 'style', 'text', 'position', [.35 .05 .3 .06],...
    'background', 'w', 'string', 'A-red S-green D-blue F-yellow', 'fontsize', 20); 

% Instructions
h3=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .25 .6 .5],...
    'background', 'w', 'string',...
    'Welcome to the Stroop Color and Word Test. The purpose of this experiment is to test your speed and accuracy when responding to incongruent visual stimuli. You will be shown one word at a time. The word will appear in a black box in the center of your screen. Respond with the font color of the word, not the word itself. Respond as quickly and as accurately as possible. Use the letters ''a'', ''s'', ''d'', and ''f'' on your keyboard to name the font color in accordance with the guide at the bottom of your screen. Take a moment now to familiarize yourself with the guide. It will remain on your screen for the duration of the test. Once the test begins, do not touch your mouse. ',...
    'fontsize', 16); 
%start instructions
h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .15 .6 .25],...
    'background', 'w','string', 'Press the start button when you are ready to begin.', 'fontsize', 20); 


% uicontrol for start button
h(5) =uicontrol('units', 'normalized', 'position', [.45 .22 .1 .1], ...
    'style', 'pushbutton', 'background', 'g','string', 'Start', 'fontsize', 20, 'callback', 'set(gcf, ''UserData'',9)');
drawnow;
% Setup for start button
response=0;
press=0;
while press==0 %Keeps program from continuing until the Start button is pressed.
    pause(0.5)
    response=get(gcf,'UserData'); 
    if response==9 %Response will equal 9 once the button is pressed
        press=1; %Ends the loop to begin the trials
    end
end

% Randomizing the order of the words.
order=randperm(32); %4 colors each with four possibilities x2 = 32 total


% Begin test

pause(0.5); %To prevent response time on the first word being longer if subject is still moving mouse

%Black background for words so that the word will be centered in the black
%box.
 h3=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .25 .6 .5],...
    'background', 'k'); 


% Setting up arrays for each variable that will be saved into during the
% for loop.
congruent=zeros(1,8); %Whether or not the response was correct on congruent words
ctime=zeros(1,8); %Response time for congruent words
incongruent=zeros(1,24); %Whether or not the response was correct on incongruent words
itime=zeros(1,24); %Response time for incongruent words
Trial=zeros(32,1); %Records trial number
Congruency=zeros(32,1); %Records whether a word was congruent in the order of the trials
Accuracy=zeros(32,1); %Records whether the response was correct in the order of the trials
Reaction_Time=zeros(32,1); %Records reaction time in the order of the trials


for i=1:length(order) %Repeats until every word has been shown
    place=order(i)-8; %places information starting at 1 in the arrays for incongruent words
    if order(i)==1 %green-green congruent 1. 
        tic %starting the timer once the word is displayed
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'g', 'string', 'green', 'fontsize', 90);
        fh=figure(2); %figure for keypress response
        set(fh,'position',[0 0 .1 .1]); %setting the figure in the corner of the screen
        k=waitforbuttonpress; %pauses script until subject responds 
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 's') %correct (keypress matches font color)
                congruent(order(i))=1; %1 for correct, 0 for incorrect. 1st g-g congruent
                ctime(order(i))=toc; %reaction time, or the time between displaying the word and the subject's keypress
                k=0;
                close(fh)
            else %incorrect response
                congruent(order(i))=0; %Saves an incongruent response as a 0
                ctime(order(i))=toc;
                k=0;
                close(fh)
            end  
        end
    end
    if order(i)==2 %green-green congruent 2. 
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'g', 'string', 'green', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 's')
                congruent(order(i))=1; %one for correct, 0 for incorrect. 
                ctime(order(i))=toc; %reaction time. 
                k=0;
                close(fh)
            else
                congruent(order(i))=0;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            end  
        end
    end
    if order(i)==3 %red-red congruent 1
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'r', 'string', 'red', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'a')
                congruent(order(i))=1; 
                ctime(order(i))=toc; 
                k=0;
                close(fh)
            else
                congruent(order(i))=0;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            end  
        end
    end
    if order(i)==4 %red-red congruent 2
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'r', 'string', 'red', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'a')
                congruent(order(i))=1;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            else
                congruent(order(i))=0;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==5 %blue-blue congruent 1
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'b', 'string', 'blue', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'd')
                congruent(order(i))=1;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            else
                congruent(order(i))=0;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==6 %blue-blue congruent 2
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'b', 'string', 'blue', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'd')
                congruent(order(i))=1;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            else
                congruent(order(i))=0;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==7 %y-y congruent 1
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'y', 'string', 'yellow', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'f')
                congruent(order(i))=1;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            else
                congruent(order(i))=0;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==8 %y-y congruent 2
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'y', 'string', 'yellow', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'f')
                congruent(order(i))=1;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            else
                congruent(order(i))=0;
                ctime(order(i))=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==9 %r-g incongruent 1. (font color red, word is green)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'r', 'string', 'green', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'a')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==10 %r-g incongruent 2. (font color red, word is green)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'r', 'string', 'green', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'a')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==11 %r-b incongruent 1. (font color red, word is blue)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'r', 'string', 'blue', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'a')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==12 %r-b incongruent 2. (font color red, word is blue)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'r', 'string', 'blue', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'a')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==13 %r-y incongruent 1. (font color red, word is yellow)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'r', 'string', 'yellow', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'a')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==14 %r-y incongruent 2. (font color red, word is yellow)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'r', 'string', 'yellow', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'a')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==15 %g-r incongruent 1. (font color green, word is red)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'g', 'string', 'red', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 's')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==16 %g-r incongruent 2. (font color green, word is red)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'g', 'string', 'red', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 's')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==17 %g-b incongruent 1. (font color green, word is blue)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'g', 'string', 'blue', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 's')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==18 %g-b incongruent 2. (font color green, word is blue)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'g', 'string', 'blue', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 's')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==19 %g-y incongruent 1. (font color green, word is yellow)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'g', 'string', 'yellow', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 's')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==20 %g-y incongruent 2. (font color green, word is yellow)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'g', 'string', 'yellow', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 's')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==21 %b-r incongruent 1. (font color blue, word is red)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'b', 'string', 'red', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'd')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==22 %b-r incongruent 2. (font color blue, word is red)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'b', 'string', 'red', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'd')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==23 %b-g incongruent 1. (font color blue, word is green)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'b', 'string', 'green', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'd')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==24 %b-g incongruent 2. (font color blue, word is green)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'b', 'string', 'green', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'd')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==25 %b-y incongruent 1. (font color blue, word is yellow)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'b', 'string', 'yellow', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'd')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==26 %b-y incongruent 2. (font color blue, word is yellow)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'b', 'string', 'yellow', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'd')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==27 %y-r incongruent 1. (font color yellow, word is red)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'y', 'string', 'red', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'f')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==28 %y-r incongruent 2. (font color yellow, word is red)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'y', 'string', 'red', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'f')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==29 %y-g incongruent 1. (font color yellow, word is green)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'y', 'string', 'green', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'f')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==30 %y-g incongruent 2. (font color yellow, word is green)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'y', 'string', 'green', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'f')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==31 %y-b incongruent 1. (font color yellow, word is blue)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'y', 'string', 'blue', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'f')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end
    if order(i)==32 %y-b incongruent 2. (font color yellow, word is blue)
        tic
        h4=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .2 .6 .4],...
            'background', 'k', 'foreground', 'y', 'string', 'blue', 'fontsize', 90);
        fh=figure(2);
        set(fh,'position',[0 0 .1 .1]);
        k=waitforbuttonpress;
        while k==1
            if strcmp(get(gcf, 'currentcharacter'), 'f')
                incongruent(place)=1;
                itime(place)=toc;
                k=0;
                close(fh)
            else
                incongruent(place)=0;
                itime(place)=toc;
                k=0;
                close(fh)
            end
        end
    end 
    % Saving data into the table variables vertically
    % Trial number
    Trial(i)=i;
    %Congruency. 0 for incongruent, 1 for congruent
    if order(i) <= 8 %The words one through eight in order are congruent, the rest are incongruent
        Congruency(i,1)=1;
    else
        Congruency(i,1)=0;
    end
    %Accuracy. 0 for incorrect, 1 for correct
    if order(i) <= 8
        Accuracy(i,1)=congruent(order(i));
    else
        Accuracy(i,1)=incongruent(place);
    end
    % Reaction time
    if order(i) <= 8
        Reaction_Time(i,1)=ctime(order(i));
    else
        Reaction_Time(i,1)=itime(place);
    end 
    
end

%Writing to an Excel file. Columns: trial, congruency, accuracy, and
%reaction time. First, I created a table with these variables, then wrote
%them to an excel file.
T= table(Trial, Congruency, Accuracy, Reaction_Time);
filename='stroopdata.xlsx';
writetable(T,filename)

close all

% Results Screen
f2 = figure(2); %figure window for results
set(f2, 'menubar', 'none');
set(f2, 'position', [left, bottom, width, height]);
drawnow;

h6=uicontrol('units', 'normalized', 'style', 'text', 'position', [.35 .85 .28 .1],...
    'string', 'Stroop Color and Word Test', 'fontsize', 25); %title text
h7=uicontrol('units', 'normalized', 'style', 'text', 'position', [.2 .7 .6 .15],...
    'string',...
    'You have completed this task. Your results are displayed below in the graphs below, as well as the Excel file titled ''stroopdata.xlsx''.',...
    'fontsize', 16); %Results screen explanation.  



% Arranging data to be graphed
%For both congruent and incongruent trials, I collected the percent
%correct. Then I found the average reaction time for each.
ccorrect=sum(congruent);
cc=(ccorrect/8)*100;
cincorrect=8-sum(congruent);
ci=(cincorrect/8)*100;
caverage=mean(ctime);

icorrect=sum(incongruent);
inc=(icorrect/24)*100;
iincorrect=24-sum(incongruent);
ini=(iincorrect/24)*100;
iaverage=mean(itime);


% plotting results
% Bar graph of congruency vs. percent correct
x=categorical({'Congruent', 'Incongruent'}); %x axis
vals=[cc, ci; inc, ini]; %two bars for each congruency: % correct or incorrect
l={'Correct', 'Incorrect'}; % Information for the legend.
b1=subplot(1,2,1);
bar(x,vals);
set(b1, 'position', [.05 .2 .4 .4]);
title('Congruency vs. Percent Correct');
ylabel('Percent Correct or Incorrect (%)');
ylim([0 105])
legend(l)

% Bar graph of congruency vs. reaction time
together=[caverage iaverage]; %calculating the y-axis limits to best display the bars
maxlim=max(together)+0.1;
minlim=min(together)-0.1;
y=categorical({'Congruent', 'Incongruent'}); %x axis
vals2=[caverage; iaverage];
b2=subplot(1,2,2);
bar(y,vals2);
set(b2, 'position', [.55 .2 .4 .4]);
title('Congruency vs. Reaction Time')
ylabel('Reaction Time (sec)');
ylim([minlim maxlim])
