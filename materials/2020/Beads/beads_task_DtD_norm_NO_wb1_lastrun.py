#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
This experiment was created using PsychoPy3 Experiment Builder (v2022.2.5),
    on Thu Apr 13 11:34:25 2023
If you publish work using this script the most relevant publication is:

    Peirce J, Gray JR, Simpson S, MacAskill M, Höchenberger R, Sogo H, Kastman E, Lindeløv JK. (2019) 
        PsychoPy2: Experiments in behavior made easy Behav Res 51: 195. 
        https://doi.org/10.3758/s13428-018-01193-y

"""

# --- Import packages ---
from psychopy import locale_setup
from psychopy import prefs
from psychopy import sound, gui, visual, core, data, event, logging, clock, colors, layout
from psychopy.constants import (NOT_STARTED, STARTED, PLAYING, PAUSED,
                                STOPPED, FINISHED, PRESSED, RELEASED, FOREVER)

import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy import (sin, cos, tan, log, log10, pi, average,
                   sqrt, std, deg2rad, rad2deg, linspace, asarray)
from numpy.random import random, randint, normal, shuffle, choice as randchoice
import os  # handy system and path functions
import sys  # to get file system encoding

import psychopy.iohub as io
from psychopy.hardware import keyboard



# Ensure that relative paths start from the same directory as this script
_thisDir = os.path.dirname(os.path.abspath(__file__))
os.chdir(_thisDir)
# Store info about the experiment session
psychopyVersion = '2022.2.5'
expName = 'beads_task_DtD_norm_NO_wb1'  # from the Builder filename that created this script
expInfo = {
    'session': '001',
    'participant': '',
}
# --- Show participant info dialog --
dlg = gui.DlgFromDict(dictionary=expInfo, sortKeys=False, title=expName)
if dlg.OK == False:
    core.quit()  # user pressed cancel
expInfo['date'] = data.getDateStr()  # add a simple timestamp
expInfo['expName'] = expName
expInfo['psychopyVersion'] = psychopyVersion

# Data file name stem = absolute path + name; later add .psyexp, .csv, .log, etc
filename = _thisDir + os.sep + u'data/%s_%s_%s' % (expInfo['participant'], expName, expInfo['date'])

# An ExperimentHandler isn't essential but helps with data saving
thisExp = data.ExperimentHandler(name=expName, version='',
    extraInfo=expInfo, runtimeInfo=None,
    originPath='/Users/klevjer/R Projects/Probabilistic Reasoning/materials/2020/Beads/beads_task_DtD_norm_NO_wb1_lastrun.py',
    savePickle=True, saveWideText=True,
    dataFileName=filename)
# save a log file for detail verbose info
logFile = logging.LogFile(filename+'.log', level=logging.EXP)
logging.console.setLevel(logging.WARNING)  # this outputs to the screen, not a file

endExpNow = False  # flag for 'escape' or other condition => quit the exp
frameTolerance = 0.001  # how close to onset before 'same' frame

# Start Code - component code to be run after the window creation

# --- Setup the Window ---
win = visual.Window(
    size=[1920, 1080], fullscr=True, screen=0, 
    winType='pyglet', allowStencil=False,
    monitor='testMonitor', color=[-1,-1,-1], colorSpace='rgb',
    blendMode='avg', useFBO=True)
win.mouseVisible = False
# store frame rate of monitor if we can measure it
expInfo['frameRate'] = win.getActualFrameRate()
if expInfo['frameRate'] != None:
    frameDur = 1.0 / round(expInfo['frameRate'])
else:
    frameDur = 1.0 / 60.0  # could not measure, so guess
# --- Setup input devices ---
ioConfig = {}

# Setup iohub keyboard
ioConfig['Keyboard'] = dict(use_keymap='psychopy')

ioSession = '1'
if 'session' in expInfo:
    ioSession = str(expInfo['session'])
ioServer = io.launchHubServer(window=win, **ioConfig)
eyetracker = None

# create a default keyboard (e.g. to check for escape)
defaultKeyboard = keyboard.Keyboard(backend='iohub')

# --- Initialize components for Routine "instructions" ---
instructions_2 = visual.TextStim(win=win, name='instructions_2',
    text='Du vil få presentert to krukker med gule og blå kuler.\nDu får vite fordelingen mellom blå og gule kuler i hver krukke.\nKulene trekkes tilfeldig fra en av krukkene, og erstattes deretter av en ny kule. \nDet vil si at det hele tiden er like mange kuler i krukken, og at forholdet mellom fargene ikke forandrer seg.\n\nOppgaven din er å finne ut hvilken krukke kulene trekkes fra.\nDu kan be om å få se så mange kuler som du ønsker ved å trykke på SPACE-knappen.\nKun når du føler at du har samlet nok informasjon skal du bestemme deg.\nDu kan velge ved å trykke på den gule tasten for krukken med flest gule kuler og på den blå tasten for krukken med mest blå kuler.\n\nFordelingen mellom fargene bytter mellom hver oppgave, så det er viktig at du leser all informasjonen på skjermen for hver oppgave.\n\nNår du er klar, trykk SPACE for å starte.\n\nLykke til!\n',
    font='Arial',
    pos=(0, 0), height=0.05, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);
key_resp_7 = keyboard.Keyboard()

# --- Initialize components for Routine "trial_1" ---
current_bead = visual.ImageStim(
    win=win,
    name='current_bead', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(0, 0), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=0.0)
option = visual.TextStim(win=win, name='option',
    text="Trykk '1' tast for 85% blå\nTrykk '2' tast for 85% gul\nTrykk SPACE for å se enda en kule\n",
    font='Arial',
    pos=(0,0.6), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);
image = visual.ImageStim(
    win=win,
    name='image', 
    image='jars.jpg', mask=None, anchor='center',
    ori=0, pos=(-0.8, 0.6), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-2.0)
b_text_3_ = visual.TextStim(win=win, name='b_text_3_',
    text='85:15',
    font='Arial',
    pos=(-0.58,0.7), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);
key_resp_3 = keyboard.Keyboard()

# --- Initialize components for Routine "next" ---
text = visual.TextStim(win=win, name='text',
    text='Gjør det klar!\nTrykk SPACE for å fortsette',
    font='Arial',
    pos=(0, 0), height=0.1, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);
key_resp_2 = keyboard.Keyboard()

# --- Initialize components for Routine "trial_2" ---
current_bead_2 = visual.ImageStim(
    win=win,
    name='current_bead_2', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(0, 0), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=0.0)
option_2 = visual.TextStim(win=win, name='option_2',
    text='Trykk blå tast for 85% blå\nTrykk gul tast for 85% gul\nTrykk SPACE for å se enda en kule\n',
    font='Arial',
    pos=(0,0.6), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);
image_2 = visual.ImageStim(
    win=win,
    name='image_2', 
    image='jars.jpg', mask=None, anchor='center',
    ori=0, pos=(-0.8, 0.6), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-2.0)
ratio = visual.TextStim(win=win, name='ratio',
    text='85:15',
    font='Arial',
    pos=(-0.58,0.7), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);
b_key_resp_4_ = keyboard.Keyboard()

# --- Initialize components for Routine "next" ---
text = visual.TextStim(win=win, name='text',
    text='Gjør det klar!\nTrykk SPACE for å fortsette',
    font='Arial',
    pos=(0, 0), height=0.1, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);
key_resp_2 = keyboard.Keyboard()

# --- Initialize components for Routine "trial_3" ---
current_bead_3 = visual.ImageStim(
    win=win,
    name='current_bead_3', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(0, 0), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=0.0)
option_3 = visual.TextStim(win=win, name='option_3',
    text='Trykk blå tast for 60% blå\nTrykk gul tast for 60% gul\nTrykk SPACE for å se enda en kule\n',
    font='Arial',
    pos=(0,0.6), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);
image_3 = visual.ImageStim(
    win=win,
    name='image_3', 
    image='jars_6040.jpg', mask=None, anchor='center',
    ori=0, pos=(-0.8, 0.6), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-2.0)
ratio_2 = visual.TextStim(win=win, name='ratio_2',
    text='60:40',
    font='Arial',
    pos=(-0.58,0.7), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);
b_key_resp_5_ = keyboard.Keyboard()

# --- Initialize components for Routine "next" ---
text = visual.TextStim(win=win, name='text',
    text='Gjør det klar!\nTrykk SPACE for å fortsette',
    font='Arial',
    pos=(0, 0), height=0.1, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);
key_resp_2 = keyboard.Keyboard()

# --- Initialize components for Routine "trial_4" ---
current_bead_4 = visual.ImageStim(
    win=win,
    name='current_bead_4', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(0, 0), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=0.0)
option_4 = visual.TextStim(win=win, name='option_4',
    text='Trykk blå tast for 60% blå\nTrykk gul tast for 60% gul\nTrykk SPACE for å se enda en kule\n',
    font='Arial',
    pos=(0,0.6), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);
image_4 = visual.ImageStim(
    win=win,
    name='image_4', 
    image='jars_6040.jpg', mask=None, anchor='center',
    ori=0, pos=(-0.8, 0.6), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-2.0)
ratio_3 = visual.TextStim(win=win, name='ratio_3',
    text='60:40',
    font='Arial',
    pos=(-0.58,0.7), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);
b_key_resp_6_ = keyboard.Keyboard()

# --- Initialize components for Routine "next" ---
text = visual.TextStim(win=win, name='text',
    text='Gjør det klar!\nTrykk SPACE for å fortsette',
    font='Arial',
    pos=(0, 0), height=0.1, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);
key_resp_2 = keyboard.Keyboard()

# --- Initialize components for Routine "trial_5" ---
current_bead_5 = visual.ImageStim(
    win=win,
    name='current_bead_5', 
    image='sin', mask=None, anchor='center',
    ori=0, pos=(0, 0), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=0.0)
option_5 = visual.TextStim(win=win, name='option_5',
    text='Trykk 1 tast for 85:15\nTrykk 2 tast for 50:50\nTrykk SPACE for å se enda en kule\n',
    font='Arial',
    pos=(0.1,0.6), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);
image_5 = visual.ImageStim(
    win=win,
    name='image_5', 
    image='jars_50508020b.jpg', mask=None, anchor='center',
    ori=0, pos=(-0.8, 0.6), size=None,
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-2.0)
ratio_4 = visual.TextStim(win=win, name='ratio_4',
    text='venstre krukke: 85:15\nhøyre krukke: 50:50',
    font='Arial',
    pos=(-0.45,0.6), height=0.07, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-3.0);
b_key_resp_8_ = keyboard.Keyboard()

# --- Initialize components for Routine "end_of_task" ---
text_2 = visual.TextStim(win=win, name='text_2',
    text='Takk skal du ha!\nOppgaven er over.\n',
    font='Arial',
    pos=(0, 0), height=0.1, wrapWidth=None, ori=0, 
    color='white', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=0.0);

# Create some handy timers
globalClock = core.Clock()  # to track the time since experiment started
routineTimer = core.Clock()  # to track time remaining of each (possibly non-slip) routine 

# --- Prepare to start Routine "instructions" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
key_resp_7.keys = []
key_resp_7.rt = []
_key_resp_7_allKeys = []
# keep track of which components have finished
instructionsComponents = [instructions_2, key_resp_7]
for thisComponent in instructionsComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
frameN = -1

# --- Run Routine "instructions" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *instructions_2* updates
    if instructions_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        instructions_2.frameNStart = frameN  # exact frame index
        instructions_2.tStart = t  # local t and not account for scr refresh
        instructions_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(instructions_2, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'instructions_2.started')
        instructions_2.setAutoDraw(True)
    
    # *key_resp_7* updates
    waitOnFlip = False
    if key_resp_7.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        key_resp_7.frameNStart = frameN  # exact frame index
        key_resp_7.tStart = t  # local t and not account for scr refresh
        key_resp_7.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_7, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'key_resp_7.started')
        key_resp_7.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_7.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_7.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_7.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_7.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_7_allKeys.extend(theseKeys)
        if len(_key_resp_7_allKeys):
            key_resp_7.keys = _key_resp_7_allKeys[-1].name  # just the last key pressed
            key_resp_7.rt = _key_resp_7_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in instructionsComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "instructions" ---
for thisComponent in instructionsComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# check responses
if key_resp_7.keys in ['', [], None]:  # No response was made
    key_resp_7.keys = None
thisExp.addData('key_resp_7.keys',key_resp_7.keys)
if key_resp_7.keys != None:  # we had a response
    thisExp.addData('key_resp_7.rt', key_resp_7.rt)
thisExp.nextEntry()
# the Routine "instructions" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
trials = data.TrialHandler(nReps=1, method='sequential', 
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('trialdef_8515_seq1_small.xlsx'),
    seed=None, name='trials')
thisExp.addLoop(trials)  # add the loop to the experiment
thisTrial = trials.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
if thisTrial != None:
    for paramName in thisTrial:
        exec('{} = thisTrial[paramName]'.format(paramName))

for thisTrial in trials:
    currentLoop = trials
    # abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
    if thisTrial != None:
        for paramName in thisTrial:
            exec('{} = thisTrial[paramName]'.format(paramName))
    
    # --- Prepare to start Routine "trial_1" ---
    continueRoutine = True
    routineForceEnded = False
    # update component parameters for each repeat
    current_bead.setImage(SequenceName)
    key_resp_3.keys = []
    key_resp_3.rt = []
    _key_resp_3_allKeys = []
    # keep track of which components have finished
    trial_1Components = [current_bead, option, image, b_text_3_, key_resp_3]
    for thisComponent in trial_1Components:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    frameN = -1
    
    # --- Run Routine "trial_1" ---
    while continueRoutine and routineTimer.getTime() < 120.0:
        # get current time
        t = routineTimer.getTime()
        tThisFlip = win.getFutureFlipTime(clock=routineTimer)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *current_bead* updates
        if current_bead.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            current_bead.frameNStart = frameN  # exact frame index
            current_bead.tStart = t  # local t and not account for scr refresh
            current_bead.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(current_bead, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'current_bead.started')
            current_bead.setAutoDraw(True)
        if current_bead.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > current_bead.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                current_bead.tStop = t  # not accounting for scr refresh
                current_bead.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'current_bead.stopped')
                current_bead.setAutoDraw(False)
        
        # *option* updates
        if option.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            option.frameNStart = frameN  # exact frame index
            option.tStart = t  # local t and not account for scr refresh
            option.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(option, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'option.started')
            option.setAutoDraw(True)
        if option.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > option.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                option.tStop = t  # not accounting for scr refresh
                option.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'option.stopped')
                option.setAutoDraw(False)
        
        # *image* updates
        if image.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            image.frameNStart = frameN  # exact frame index
            image.tStart = t  # local t and not account for scr refresh
            image.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(image, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'image.started')
            image.setAutoDraw(True)
        if image.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > image.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                image.tStop = t  # not accounting for scr refresh
                image.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'image.stopped')
                image.setAutoDraw(False)
        
        # *b_text_3_* updates
        if b_text_3_.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            b_text_3_.frameNStart = frameN  # exact frame index
            b_text_3_.tStart = t  # local t and not account for scr refresh
            b_text_3_.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(b_text_3_, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'b_text_3_.started')
            b_text_3_.setAutoDraw(True)
        if b_text_3_.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > b_text_3_.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                b_text_3_.tStop = t  # not accounting for scr refresh
                b_text_3_.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'b_text_3_.stopped')
                b_text_3_.setAutoDraw(False)
        # Run 'Each Frame' code from code
        if event.getKeys(keyList=['j', 'k']):
           trials.finished = True
           continueRoutine = False
        
        # *key_resp_3* updates
        waitOnFlip = False
        if key_resp_3.status == NOT_STARTED and tThisFlip >= 0-frameTolerance:
            # keep track of start time/frame for later
            key_resp_3.frameNStart = frameN  # exact frame index
            key_resp_3.tStart = t  # local t and not account for scr refresh
            key_resp_3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(key_resp_3, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'key_resp_3.started')
            key_resp_3.status = STARTED
            # keyboard checking is just starting
            waitOnFlip = True
            win.callOnFlip(key_resp_3.clock.reset)  # t=0 on next screen flip
            win.callOnFlip(key_resp_3.clearEvents, eventType='keyboard')  # clear events on next screen flip
        if key_resp_3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > key_resp_3.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                key_resp_3.tStop = t  # not accounting for scr refresh
                key_resp_3.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'key_resp_3.stopped')
                key_resp_3.status = FINISHED
        if key_resp_3.status == STARTED and not waitOnFlip:
            theseKeys = key_resp_3.getKeys(keyList=['j','k','space'], waitRelease=False)
            _key_resp_3_allKeys.extend(theseKeys)
            if len(_key_resp_3_allKeys):
                key_resp_3.keys = _key_resp_3_allKeys[-1].name  # just the last key pressed
                key_resp_3.rt = _key_resp_3_allKeys[-1].rt
                # a response ends the routine
                continueRoutine = False
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            routineForceEnded = True
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in trial_1Components:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # --- Ending Routine "trial_1" ---
    for thisComponent in trial_1Components:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # check responses
    if key_resp_3.keys in ['', [], None]:  # No response was made
        key_resp_3.keys = None
    trials.addData('key_resp_3.keys',key_resp_3.keys)
    if key_resp_3.keys != None:  # we had a response
        trials.addData('key_resp_3.rt', key_resp_3.rt)
    # using non-slip timing so subtract the expected duration of this Routine (unless ended on request)
    if routineForceEnded:
        routineTimer.reset()
    else:
        routineTimer.addTime(-120.000000)
    thisExp.nextEntry()
    
# completed 1 repeats of 'trials'

# get names of stimulus parameters
if trials.trialList in ([], [None], None):
    params = []
else:
    params = trials.trialList[0].keys()
# save data for this loop
trials.saveAsExcel(filename + '.xlsx', sheetName='trials',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])
trials.saveAsText(filename + 'trials.csv', delim=',',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])

# --- Prepare to start Routine "next" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
key_resp_2.keys = []
key_resp_2.rt = []
_key_resp_2_allKeys = []
# keep track of which components have finished
nextComponents = [text, key_resp_2]
for thisComponent in nextComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
frameN = -1

# --- Run Routine "next" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *text* updates
    if text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        text.frameNStart = frameN  # exact frame index
        text.tStart = t  # local t and not account for scr refresh
        text.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(text, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'text.started')
        text.setAutoDraw(True)
    
    # *key_resp_2* updates
    waitOnFlip = False
    if key_resp_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        key_resp_2.frameNStart = frameN  # exact frame index
        key_resp_2.tStart = t  # local t and not account for scr refresh
        key_resp_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_2, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'key_resp_2.started')
        key_resp_2.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_2.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_2.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_2.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_2.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_2_allKeys.extend(theseKeys)
        if len(_key_resp_2_allKeys):
            key_resp_2.keys = _key_resp_2_allKeys[-1].name  # just the last key pressed
            key_resp_2.rt = _key_resp_2_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in nextComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "next" ---
for thisComponent in nextComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# check responses
if key_resp_2.keys in ['', [], None]:  # No response was made
    key_resp_2.keys = None
thisExp.addData('key_resp_2.keys',key_resp_2.keys)
if key_resp_2.keys != None:  # we had a response
    thisExp.addData('key_resp_2.rt', key_resp_2.rt)
thisExp.nextEntry()
# the Routine "next" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
trials_2 = data.TrialHandler(nReps=1, method='sequential', 
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('trialdef_8515_seq3_small.xlsx'),
    seed=None, name='trials_2')
thisExp.addLoop(trials_2)  # add the loop to the experiment
thisTrial_2 = trials_2.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisTrial_2.rgb)
if thisTrial_2 != None:
    for paramName in thisTrial_2:
        exec('{} = thisTrial_2[paramName]'.format(paramName))

for thisTrial_2 in trials_2:
    currentLoop = trials_2
    # abbreviate parameter names if possible (e.g. rgb = thisTrial_2.rgb)
    if thisTrial_2 != None:
        for paramName in thisTrial_2:
            exec('{} = thisTrial_2[paramName]'.format(paramName))
    
    # --- Prepare to start Routine "trial_2" ---
    continueRoutine = True
    routineForceEnded = False
    # update component parameters for each repeat
    current_bead_2.setImage(SequenceName)
    b_key_resp_4_.keys = []
    b_key_resp_4_.rt = []
    _b_key_resp_4__allKeys = []
    # keep track of which components have finished
    trial_2Components = [current_bead_2, option_2, image_2, ratio, b_key_resp_4_]
    for thisComponent in trial_2Components:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    frameN = -1
    
    # --- Run Routine "trial_2" ---
    while continueRoutine and routineTimer.getTime() < 120.0:
        # get current time
        t = routineTimer.getTime()
        tThisFlip = win.getFutureFlipTime(clock=routineTimer)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *current_bead_2* updates
        if current_bead_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            current_bead_2.frameNStart = frameN  # exact frame index
            current_bead_2.tStart = t  # local t and not account for scr refresh
            current_bead_2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(current_bead_2, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'current_bead_2.started')
            current_bead_2.setAutoDraw(True)
        if current_bead_2.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > current_bead_2.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                current_bead_2.tStop = t  # not accounting for scr refresh
                current_bead_2.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'current_bead_2.stopped')
                current_bead_2.setAutoDraw(False)
        
        # *option_2* updates
        if option_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            option_2.frameNStart = frameN  # exact frame index
            option_2.tStart = t  # local t and not account for scr refresh
            option_2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(option_2, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'option_2.started')
            option_2.setAutoDraw(True)
        if option_2.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > option_2.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                option_2.tStop = t  # not accounting for scr refresh
                option_2.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'option_2.stopped')
                option_2.setAutoDraw(False)
        
        # *image_2* updates
        if image_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            image_2.frameNStart = frameN  # exact frame index
            image_2.tStart = t  # local t and not account for scr refresh
            image_2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(image_2, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'image_2.started')
            image_2.setAutoDraw(True)
        if image_2.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > image_2.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                image_2.tStop = t  # not accounting for scr refresh
                image_2.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'image_2.stopped')
                image_2.setAutoDraw(False)
        
        # *ratio* updates
        if ratio.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            ratio.frameNStart = frameN  # exact frame index
            ratio.tStart = t  # local t and not account for scr refresh
            ratio.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(ratio, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'ratio.started')
            ratio.setAutoDraw(True)
        if ratio.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > ratio.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                ratio.tStop = t  # not accounting for scr refresh
                ratio.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'ratio.stopped')
                ratio.setAutoDraw(False)
        # Run 'Each Frame' code from end
        if event.getKeys(keyList=['j', 'k']):
          trials_2.finished = True
          continueRoutine = False
        
        # *b_key_resp_4_* updates
        waitOnFlip = False
        if b_key_resp_4_.status == NOT_STARTED and tThisFlip >= 0-frameTolerance:
            # keep track of start time/frame for later
            b_key_resp_4_.frameNStart = frameN  # exact frame index
            b_key_resp_4_.tStart = t  # local t and not account for scr refresh
            b_key_resp_4_.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(b_key_resp_4_, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'b_key_resp_4_.started')
            b_key_resp_4_.status = STARTED
            # keyboard checking is just starting
            waitOnFlip = True
            win.callOnFlip(b_key_resp_4_.clock.reset)  # t=0 on next screen flip
            win.callOnFlip(b_key_resp_4_.clearEvents, eventType='keyboard')  # clear events on next screen flip
        if b_key_resp_4_.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > b_key_resp_4_.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                b_key_resp_4_.tStop = t  # not accounting for scr refresh
                b_key_resp_4_.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'b_key_resp_4_.stopped')
                b_key_resp_4_.status = FINISHED
        if b_key_resp_4_.status == STARTED and not waitOnFlip:
            theseKeys = b_key_resp_4_.getKeys(keyList=['j','k','space'], waitRelease=False)
            _b_key_resp_4__allKeys.extend(theseKeys)
            if len(_b_key_resp_4__allKeys):
                b_key_resp_4_.keys = _b_key_resp_4__allKeys[-1].name  # just the last key pressed
                b_key_resp_4_.rt = _b_key_resp_4__allKeys[-1].rt
                # a response ends the routine
                continueRoutine = False
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            routineForceEnded = True
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in trial_2Components:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # --- Ending Routine "trial_2" ---
    for thisComponent in trial_2Components:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # check responses
    if b_key_resp_4_.keys in ['', [], None]:  # No response was made
        b_key_resp_4_.keys = None
    trials_2.addData('b_key_resp_4_.keys',b_key_resp_4_.keys)
    if b_key_resp_4_.keys != None:  # we had a response
        trials_2.addData('b_key_resp_4_.rt', b_key_resp_4_.rt)
    # using non-slip timing so subtract the expected duration of this Routine (unless ended on request)
    if routineForceEnded:
        routineTimer.reset()
    else:
        routineTimer.addTime(-120.000000)
    thisExp.nextEntry()
    
# completed 1 repeats of 'trials_2'

# get names of stimulus parameters
if trials_2.trialList in ([], [None], None):
    params = []
else:
    params = trials_2.trialList[0].keys()
# save data for this loop
trials_2.saveAsExcel(filename + '.xlsx', sheetName='trials_2',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])
trials_2.saveAsText(filename + 'trials_2.csv', delim=',',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])

# --- Prepare to start Routine "next" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
key_resp_2.keys = []
key_resp_2.rt = []
_key_resp_2_allKeys = []
# keep track of which components have finished
nextComponents = [text, key_resp_2]
for thisComponent in nextComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
frameN = -1

# --- Run Routine "next" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *text* updates
    if text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        text.frameNStart = frameN  # exact frame index
        text.tStart = t  # local t and not account for scr refresh
        text.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(text, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'text.started')
        text.setAutoDraw(True)
    
    # *key_resp_2* updates
    waitOnFlip = False
    if key_resp_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        key_resp_2.frameNStart = frameN  # exact frame index
        key_resp_2.tStart = t  # local t and not account for scr refresh
        key_resp_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_2, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'key_resp_2.started')
        key_resp_2.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_2.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_2.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_2.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_2.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_2_allKeys.extend(theseKeys)
        if len(_key_resp_2_allKeys):
            key_resp_2.keys = _key_resp_2_allKeys[-1].name  # just the last key pressed
            key_resp_2.rt = _key_resp_2_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in nextComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "next" ---
for thisComponent in nextComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# check responses
if key_resp_2.keys in ['', [], None]:  # No response was made
    key_resp_2.keys = None
thisExp.addData('key_resp_2.keys',key_resp_2.keys)
if key_resp_2.keys != None:  # we had a response
    thisExp.addData('key_resp_2.rt', key_resp_2.rt)
thisExp.nextEntry()
# the Routine "next" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
trials_3 = data.TrialHandler(nReps=1, method='sequential', 
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('trialdef_6040_seq1_small.xlsx'),
    seed=None, name='trials_3')
thisExp.addLoop(trials_3)  # add the loop to the experiment
thisTrial_3 = trials_3.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisTrial_3.rgb)
if thisTrial_3 != None:
    for paramName in thisTrial_3:
        exec('{} = thisTrial_3[paramName]'.format(paramName))

for thisTrial_3 in trials_3:
    currentLoop = trials_3
    # abbreviate parameter names if possible (e.g. rgb = thisTrial_3.rgb)
    if thisTrial_3 != None:
        for paramName in thisTrial_3:
            exec('{} = thisTrial_3[paramName]'.format(paramName))
    
    # --- Prepare to start Routine "trial_3" ---
    continueRoutine = True
    routineForceEnded = False
    # update component parameters for each repeat
    current_bead_3.setImage(SequenceName)
    b_key_resp_5_.keys = []
    b_key_resp_5_.rt = []
    _b_key_resp_5__allKeys = []
    # keep track of which components have finished
    trial_3Components = [current_bead_3, option_3, image_3, ratio_2, b_key_resp_5_]
    for thisComponent in trial_3Components:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    frameN = -1
    
    # --- Run Routine "trial_3" ---
    while continueRoutine and routineTimer.getTime() < 120.0:
        # get current time
        t = routineTimer.getTime()
        tThisFlip = win.getFutureFlipTime(clock=routineTimer)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *current_bead_3* updates
        if current_bead_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            current_bead_3.frameNStart = frameN  # exact frame index
            current_bead_3.tStart = t  # local t and not account for scr refresh
            current_bead_3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(current_bead_3, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'current_bead_3.started')
            current_bead_3.setAutoDraw(True)
        if current_bead_3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > current_bead_3.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                current_bead_3.tStop = t  # not accounting for scr refresh
                current_bead_3.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'current_bead_3.stopped')
                current_bead_3.setAutoDraw(False)
        
        # *option_3* updates
        if option_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            option_3.frameNStart = frameN  # exact frame index
            option_3.tStart = t  # local t and not account for scr refresh
            option_3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(option_3, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'option_3.started')
            option_3.setAutoDraw(True)
        if option_3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > option_3.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                option_3.tStop = t  # not accounting for scr refresh
                option_3.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'option_3.stopped')
                option_3.setAutoDraw(False)
        
        # *image_3* updates
        if image_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            image_3.frameNStart = frameN  # exact frame index
            image_3.tStart = t  # local t and not account for scr refresh
            image_3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(image_3, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'image_3.started')
            image_3.setAutoDraw(True)
        if image_3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > image_3.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                image_3.tStop = t  # not accounting for scr refresh
                image_3.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'image_3.stopped')
                image_3.setAutoDraw(False)
        
        # *ratio_2* updates
        if ratio_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            ratio_2.frameNStart = frameN  # exact frame index
            ratio_2.tStart = t  # local t and not account for scr refresh
            ratio_2.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(ratio_2, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'ratio_2.started')
            ratio_2.setAutoDraw(True)
        if ratio_2.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > ratio_2.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                ratio_2.tStop = t  # not accounting for scr refresh
                ratio_2.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'ratio_2.stopped')
                ratio_2.setAutoDraw(False)
        # Run 'Each Frame' code from end_2
        if event.getKeys(keyList=['j', 'k']):
          trials_3.finished = True
          continueRoutine = False
        
        # *b_key_resp_5_* updates
        waitOnFlip = False
        if b_key_resp_5_.status == NOT_STARTED and tThisFlip >= 0-frameTolerance:
            # keep track of start time/frame for later
            b_key_resp_5_.frameNStart = frameN  # exact frame index
            b_key_resp_5_.tStart = t  # local t and not account for scr refresh
            b_key_resp_5_.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(b_key_resp_5_, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'b_key_resp_5_.started')
            b_key_resp_5_.status = STARTED
            # keyboard checking is just starting
            waitOnFlip = True
            win.callOnFlip(b_key_resp_5_.clock.reset)  # t=0 on next screen flip
            win.callOnFlip(b_key_resp_5_.clearEvents, eventType='keyboard')  # clear events on next screen flip
        if b_key_resp_5_.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > b_key_resp_5_.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                b_key_resp_5_.tStop = t  # not accounting for scr refresh
                b_key_resp_5_.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'b_key_resp_5_.stopped')
                b_key_resp_5_.status = FINISHED
        if b_key_resp_5_.status == STARTED and not waitOnFlip:
            theseKeys = b_key_resp_5_.getKeys(keyList=['j','k','space'], waitRelease=False)
            _b_key_resp_5__allKeys.extend(theseKeys)
            if len(_b_key_resp_5__allKeys):
                b_key_resp_5_.keys = _b_key_resp_5__allKeys[-1].name  # just the last key pressed
                b_key_resp_5_.rt = _b_key_resp_5__allKeys[-1].rt
                # a response ends the routine
                continueRoutine = False
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            routineForceEnded = True
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in trial_3Components:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # --- Ending Routine "trial_3" ---
    for thisComponent in trial_3Components:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # check responses
    if b_key_resp_5_.keys in ['', [], None]:  # No response was made
        b_key_resp_5_.keys = None
    trials_3.addData('b_key_resp_5_.keys',b_key_resp_5_.keys)
    if b_key_resp_5_.keys != None:  # we had a response
        trials_3.addData('b_key_resp_5_.rt', b_key_resp_5_.rt)
    # using non-slip timing so subtract the expected duration of this Routine (unless ended on request)
    if routineForceEnded:
        routineTimer.reset()
    else:
        routineTimer.addTime(-120.000000)
    thisExp.nextEntry()
    
# completed 1 repeats of 'trials_3'

# get names of stimulus parameters
if trials_3.trialList in ([], [None], None):
    params = []
else:
    params = trials_3.trialList[0].keys()
# save data for this loop
trials_3.saveAsExcel(filename + '.xlsx', sheetName='trials_3',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])
trials_3.saveAsText(filename + 'trials_3.csv', delim=',',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])

# --- Prepare to start Routine "next" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
key_resp_2.keys = []
key_resp_2.rt = []
_key_resp_2_allKeys = []
# keep track of which components have finished
nextComponents = [text, key_resp_2]
for thisComponent in nextComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
frameN = -1

# --- Run Routine "next" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *text* updates
    if text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        text.frameNStart = frameN  # exact frame index
        text.tStart = t  # local t and not account for scr refresh
        text.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(text, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'text.started')
        text.setAutoDraw(True)
    
    # *key_resp_2* updates
    waitOnFlip = False
    if key_resp_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        key_resp_2.frameNStart = frameN  # exact frame index
        key_resp_2.tStart = t  # local t and not account for scr refresh
        key_resp_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_2, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'key_resp_2.started')
        key_resp_2.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_2.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_2.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_2.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_2.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_2_allKeys.extend(theseKeys)
        if len(_key_resp_2_allKeys):
            key_resp_2.keys = _key_resp_2_allKeys[-1].name  # just the last key pressed
            key_resp_2.rt = _key_resp_2_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in nextComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "next" ---
for thisComponent in nextComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# check responses
if key_resp_2.keys in ['', [], None]:  # No response was made
    key_resp_2.keys = None
thisExp.addData('key_resp_2.keys',key_resp_2.keys)
if key_resp_2.keys != None:  # we had a response
    thisExp.addData('key_resp_2.rt', key_resp_2.rt)
thisExp.nextEntry()
# the Routine "next" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
trials_4 = data.TrialHandler(nReps=1, method='sequential', 
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('trialdef_6040_seq3_small.xlsx'),
    seed=None, name='trials_4')
thisExp.addLoop(trials_4)  # add the loop to the experiment
thisTrial_4 = trials_4.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisTrial_4.rgb)
if thisTrial_4 != None:
    for paramName in thisTrial_4:
        exec('{} = thisTrial_4[paramName]'.format(paramName))

for thisTrial_4 in trials_4:
    currentLoop = trials_4
    # abbreviate parameter names if possible (e.g. rgb = thisTrial_4.rgb)
    if thisTrial_4 != None:
        for paramName in thisTrial_4:
            exec('{} = thisTrial_4[paramName]'.format(paramName))
    
    # --- Prepare to start Routine "trial_4" ---
    continueRoutine = True
    routineForceEnded = False
    # update component parameters for each repeat
    current_bead_4.setImage(SequenceName)
    b_key_resp_6_.keys = []
    b_key_resp_6_.rt = []
    _b_key_resp_6__allKeys = []
    # keep track of which components have finished
    trial_4Components = [current_bead_4, option_4, image_4, ratio_3, b_key_resp_6_]
    for thisComponent in trial_4Components:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    frameN = -1
    
    # --- Run Routine "trial_4" ---
    while continueRoutine and routineTimer.getTime() < 120.0:
        # get current time
        t = routineTimer.getTime()
        tThisFlip = win.getFutureFlipTime(clock=routineTimer)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *current_bead_4* updates
        if current_bead_4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            current_bead_4.frameNStart = frameN  # exact frame index
            current_bead_4.tStart = t  # local t and not account for scr refresh
            current_bead_4.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(current_bead_4, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'current_bead_4.started')
            current_bead_4.setAutoDraw(True)
        if current_bead_4.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > current_bead_4.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                current_bead_4.tStop = t  # not accounting for scr refresh
                current_bead_4.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'current_bead_4.stopped')
                current_bead_4.setAutoDraw(False)
        
        # *option_4* updates
        if option_4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            option_4.frameNStart = frameN  # exact frame index
            option_4.tStart = t  # local t and not account for scr refresh
            option_4.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(option_4, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'option_4.started')
            option_4.setAutoDraw(True)
        if option_4.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > option_4.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                option_4.tStop = t  # not accounting for scr refresh
                option_4.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'option_4.stopped')
                option_4.setAutoDraw(False)
        
        # *image_4* updates
        if image_4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            image_4.frameNStart = frameN  # exact frame index
            image_4.tStart = t  # local t and not account for scr refresh
            image_4.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(image_4, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'image_4.started')
            image_4.setAutoDraw(True)
        if image_4.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > image_4.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                image_4.tStop = t  # not accounting for scr refresh
                image_4.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'image_4.stopped')
                image_4.setAutoDraw(False)
        
        # *ratio_3* updates
        if ratio_3.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            ratio_3.frameNStart = frameN  # exact frame index
            ratio_3.tStart = t  # local t and not account for scr refresh
            ratio_3.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(ratio_3, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'ratio_3.started')
            ratio_3.setAutoDraw(True)
        if ratio_3.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > ratio_3.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                ratio_3.tStop = t  # not accounting for scr refresh
                ratio_3.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'ratio_3.stopped')
                ratio_3.setAutoDraw(False)
        # Run 'Each Frame' code from end_3
        if event.getKeys(keyList=['j', 'k']):
          trials_4.finished = True
          continueRoutine = False
        
        # *b_key_resp_6_* updates
        waitOnFlip = False
        if b_key_resp_6_.status == NOT_STARTED and tThisFlip >= 0-frameTolerance:
            # keep track of start time/frame for later
            b_key_resp_6_.frameNStart = frameN  # exact frame index
            b_key_resp_6_.tStart = t  # local t and not account for scr refresh
            b_key_resp_6_.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(b_key_resp_6_, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'b_key_resp_6_.started')
            b_key_resp_6_.status = STARTED
            # keyboard checking is just starting
            waitOnFlip = True
            win.callOnFlip(b_key_resp_6_.clock.reset)  # t=0 on next screen flip
            win.callOnFlip(b_key_resp_6_.clearEvents, eventType='keyboard')  # clear events on next screen flip
        if b_key_resp_6_.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > b_key_resp_6_.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                b_key_resp_6_.tStop = t  # not accounting for scr refresh
                b_key_resp_6_.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'b_key_resp_6_.stopped')
                b_key_resp_6_.status = FINISHED
        if b_key_resp_6_.status == STARTED and not waitOnFlip:
            theseKeys = b_key_resp_6_.getKeys(keyList=['j','k','space'], waitRelease=False)
            _b_key_resp_6__allKeys.extend(theseKeys)
            if len(_b_key_resp_6__allKeys):
                b_key_resp_6_.keys = _b_key_resp_6__allKeys[-1].name  # just the last key pressed
                b_key_resp_6_.rt = _b_key_resp_6__allKeys[-1].rt
                # a response ends the routine
                continueRoutine = False
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            routineForceEnded = True
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in trial_4Components:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # --- Ending Routine "trial_4" ---
    for thisComponent in trial_4Components:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # check responses
    if b_key_resp_6_.keys in ['', [], None]:  # No response was made
        b_key_resp_6_.keys = None
    trials_4.addData('b_key_resp_6_.keys',b_key_resp_6_.keys)
    if b_key_resp_6_.keys != None:  # we had a response
        trials_4.addData('b_key_resp_6_.rt', b_key_resp_6_.rt)
    # using non-slip timing so subtract the expected duration of this Routine (unless ended on request)
    if routineForceEnded:
        routineTimer.reset()
    else:
        routineTimer.addTime(-120.000000)
    thisExp.nextEntry()
    
# completed 1 repeats of 'trials_4'

# get names of stimulus parameters
if trials_4.trialList in ([], [None], None):
    params = []
else:
    params = trials_4.trialList[0].keys()
# save data for this loop
trials_4.saveAsExcel(filename + '.xlsx', sheetName='trials_4',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])
trials_4.saveAsText(filename + 'trials_4.csv', delim=',',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])

# --- Prepare to start Routine "next" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
key_resp_2.keys = []
key_resp_2.rt = []
_key_resp_2_allKeys = []
# keep track of which components have finished
nextComponents = [text, key_resp_2]
for thisComponent in nextComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
frameN = -1

# --- Run Routine "next" ---
while continueRoutine:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *text* updates
    if text.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        text.frameNStart = frameN  # exact frame index
        text.tStart = t  # local t and not account for scr refresh
        text.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(text, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'text.started')
        text.setAutoDraw(True)
    
    # *key_resp_2* updates
    waitOnFlip = False
    if key_resp_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        key_resp_2.frameNStart = frameN  # exact frame index
        key_resp_2.tStart = t  # local t and not account for scr refresh
        key_resp_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(key_resp_2, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'key_resp_2.started')
        key_resp_2.status = STARTED
        # keyboard checking is just starting
        waitOnFlip = True
        win.callOnFlip(key_resp_2.clock.reset)  # t=0 on next screen flip
        win.callOnFlip(key_resp_2.clearEvents, eventType='keyboard')  # clear events on next screen flip
    if key_resp_2.status == STARTED and not waitOnFlip:
        theseKeys = key_resp_2.getKeys(keyList=['space'], waitRelease=False)
        _key_resp_2_allKeys.extend(theseKeys)
        if len(_key_resp_2_allKeys):
            key_resp_2.keys = _key_resp_2_allKeys[-1].name  # just the last key pressed
            key_resp_2.rt = _key_resp_2_allKeys[-1].rt
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in nextComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "next" ---
for thisComponent in nextComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# check responses
if key_resp_2.keys in ['', [], None]:  # No response was made
    key_resp_2.keys = None
thisExp.addData('key_resp_2.keys',key_resp_2.keys)
if key_resp_2.keys != None:  # we had a response
    thisExp.addData('key_resp_2.rt', key_resp_2.rt)
thisExp.nextEntry()
# the Routine "next" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# set up handler to look after randomisation of conditions etc
trials_5 = data.TrialHandler(nReps=1, method='sequential', 
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('trialdef_8515_seq4_small.xlsx'),
    seed=None, name='trials_5')
thisExp.addLoop(trials_5)  # add the loop to the experiment
thisTrial_5 = trials_5.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb = thisTrial_5.rgb)
if thisTrial_5 != None:
    for paramName in thisTrial_5:
        exec('{} = thisTrial_5[paramName]'.format(paramName))

for thisTrial_5 in trials_5:
    currentLoop = trials_5
    # abbreviate parameter names if possible (e.g. rgb = thisTrial_5.rgb)
    if thisTrial_5 != None:
        for paramName in thisTrial_5:
            exec('{} = thisTrial_5[paramName]'.format(paramName))
    
    # --- Prepare to start Routine "trial_5" ---
    continueRoutine = True
    routineForceEnded = False
    # update component parameters for each repeat
    current_bead_5.setImage(SequenceName)
    b_key_resp_8_.keys = []
    b_key_resp_8_.rt = []
    _b_key_resp_8__allKeys = []
    # keep track of which components have finished
    trial_5Components = [current_bead_5, option_5, image_5, ratio_4, b_key_resp_8_]
    for thisComponent in trial_5Components:
        thisComponent.tStart = None
        thisComponent.tStop = None
        thisComponent.tStartRefresh = None
        thisComponent.tStopRefresh = None
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    # reset timers
    t = 0
    _timeToFirstFrame = win.getFutureFlipTime(clock="now")
    frameN = -1
    
    # --- Run Routine "trial_5" ---
    while continueRoutine and routineTimer.getTime() < 120.0:
        # get current time
        t = routineTimer.getTime()
        tThisFlip = win.getFutureFlipTime(clock=routineTimer)
        tThisFlipGlobal = win.getFutureFlipTime(clock=None)
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        # *current_bead_5* updates
        if current_bead_5.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            current_bead_5.frameNStart = frameN  # exact frame index
            current_bead_5.tStart = t  # local t and not account for scr refresh
            current_bead_5.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(current_bead_5, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'current_bead_5.started')
            current_bead_5.setAutoDraw(True)
        if current_bead_5.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > current_bead_5.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                current_bead_5.tStop = t  # not accounting for scr refresh
                current_bead_5.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'current_bead_5.stopped')
                current_bead_5.setAutoDraw(False)
        
        # *option_5* updates
        if option_5.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            option_5.frameNStart = frameN  # exact frame index
            option_5.tStart = t  # local t and not account for scr refresh
            option_5.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(option_5, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'option_5.started')
            option_5.setAutoDraw(True)
        if option_5.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > option_5.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                option_5.tStop = t  # not accounting for scr refresh
                option_5.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'option_5.stopped')
                option_5.setAutoDraw(False)
        
        # *image_5* updates
        if image_5.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            image_5.frameNStart = frameN  # exact frame index
            image_5.tStart = t  # local t and not account for scr refresh
            image_5.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(image_5, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'image_5.started')
            image_5.setAutoDraw(True)
        if image_5.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > image_5.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                image_5.tStop = t  # not accounting for scr refresh
                image_5.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'image_5.stopped')
                image_5.setAutoDraw(False)
        
        # *ratio_4* updates
        if ratio_4.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
            # keep track of start time/frame for later
            ratio_4.frameNStart = frameN  # exact frame index
            ratio_4.tStart = t  # local t and not account for scr refresh
            ratio_4.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(ratio_4, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'ratio_4.started')
            ratio_4.setAutoDraw(True)
        if ratio_4.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > ratio_4.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                ratio_4.tStop = t  # not accounting for scr refresh
                ratio_4.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'ratio_4.stopped')
                ratio_4.setAutoDraw(False)
        # Run 'Each Frame' code from end_4
        if event.getKeys(keyList=['1', '2']):
          trials_5.finished = True
          continueRoutine = False
        
        # *b_key_resp_8_* updates
        waitOnFlip = False
        if b_key_resp_8_.status == NOT_STARTED and tThisFlip >= 0-frameTolerance:
            # keep track of start time/frame for later
            b_key_resp_8_.frameNStart = frameN  # exact frame index
            b_key_resp_8_.tStart = t  # local t and not account for scr refresh
            b_key_resp_8_.tStartRefresh = tThisFlipGlobal  # on global time
            win.timeOnFlip(b_key_resp_8_, 'tStartRefresh')  # time at next scr refresh
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'b_key_resp_8_.started')
            b_key_resp_8_.status = STARTED
            # keyboard checking is just starting
            waitOnFlip = True
            win.callOnFlip(b_key_resp_8_.clock.reset)  # t=0 on next screen flip
            win.callOnFlip(b_key_resp_8_.clearEvents, eventType='keyboard')  # clear events on next screen flip
        if b_key_resp_8_.status == STARTED:
            # is it time to stop? (based on global clock, using actual start)
            if tThisFlipGlobal > b_key_resp_8_.tStartRefresh + 120-frameTolerance:
                # keep track of stop time/frame for later
                b_key_resp_8_.tStop = t  # not accounting for scr refresh
                b_key_resp_8_.frameNStop = frameN  # exact frame index
                # add timestamp to datafile
                thisExp.timestampOnFlip(win, 'b_key_resp_8_.stopped')
                b_key_resp_8_.status = FINISHED
        if b_key_resp_8_.status == STARTED and not waitOnFlip:
            theseKeys = b_key_resp_8_.getKeys(keyList=['1','2','space'], waitRelease=False)
            _b_key_resp_8__allKeys.extend(theseKeys)
            if len(_b_key_resp_8__allKeys):
                b_key_resp_8_.keys = _b_key_resp_8__allKeys[-1].name  # just the last key pressed
                b_key_resp_8_.rt = _b_key_resp_8__allKeys[-1].rt
                # a response ends the routine
                continueRoutine = False
        
        # check for quit (typically the Esc key)
        if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            routineForceEnded = True
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in trial_5Components:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # --- Ending Routine "trial_5" ---
    for thisComponent in trial_5Components:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    # check responses
    if b_key_resp_8_.keys in ['', [], None]:  # No response was made
        b_key_resp_8_.keys = None
    trials_5.addData('b_key_resp_8_.keys',b_key_resp_8_.keys)
    if b_key_resp_8_.keys != None:  # we had a response
        trials_5.addData('b_key_resp_8_.rt', b_key_resp_8_.rt)
    # using non-slip timing so subtract the expected duration of this Routine (unless ended on request)
    if routineForceEnded:
        routineTimer.reset()
    else:
        routineTimer.addTime(-120.000000)
    thisExp.nextEntry()
    
# completed 1 repeats of 'trials_5'

# get names of stimulus parameters
if trials_5.trialList in ([], [None], None):
    params = []
else:
    params = trials_5.trialList[0].keys()
# save data for this loop
trials_5.saveAsExcel(filename + '.xlsx', sheetName='trials_5',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])
trials_5.saveAsText(filename + 'trials_5.csv', delim=',',
    stimOut=params,
    dataOut=['n','all_mean','all_std', 'all_raw'])

# --- Prepare to start Routine "end_of_task" ---
continueRoutine = True
routineForceEnded = False
# update component parameters for each repeat
# keep track of which components have finished
end_of_taskComponents = [text_2]
for thisComponent in end_of_taskComponents:
    thisComponent.tStart = None
    thisComponent.tStop = None
    thisComponent.tStartRefresh = None
    thisComponent.tStopRefresh = None
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED
# reset timers
t = 0
_timeToFirstFrame = win.getFutureFlipTime(clock="now")
frameN = -1

# --- Run Routine "end_of_task" ---
while continueRoutine and routineTimer.getTime() < 1.0:
    # get current time
    t = routineTimer.getTime()
    tThisFlip = win.getFutureFlipTime(clock=routineTimer)
    tThisFlipGlobal = win.getFutureFlipTime(clock=None)
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    # *text_2* updates
    if text_2.status == NOT_STARTED and tThisFlip >= 0.0-frameTolerance:
        # keep track of start time/frame for later
        text_2.frameNStart = frameN  # exact frame index
        text_2.tStart = t  # local t and not account for scr refresh
        text_2.tStartRefresh = tThisFlipGlobal  # on global time
        win.timeOnFlip(text_2, 'tStartRefresh')  # time at next scr refresh
        # add timestamp to datafile
        thisExp.timestampOnFlip(win, 'text_2.started')
        text_2.setAutoDraw(True)
    if text_2.status == STARTED:
        # is it time to stop? (based on global clock, using actual start)
        if tThisFlipGlobal > text_2.tStartRefresh + 1.0-frameTolerance:
            # keep track of stop time/frame for later
            text_2.tStop = t  # not accounting for scr refresh
            text_2.frameNStop = frameN  # exact frame index
            # add timestamp to datafile
            thisExp.timestampOnFlip(win, 'text_2.stopped')
            text_2.setAutoDraw(False)
    
    # check for quit (typically the Esc key)
    if endExpNow or defaultKeyboard.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        routineForceEnded = True
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in end_of_taskComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# --- Ending Routine "end_of_task" ---
for thisComponent in end_of_taskComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# using non-slip timing so subtract the expected duration of this Routine (unless ended on request)
if routineForceEnded:
    routineTimer.reset()
else:
    routineTimer.addTime(-1.000000)

# --- End experiment ---
# Flip one final time so any remaining win.callOnFlip() 
# and win.timeOnFlip() tasks get executed before quitting
win.flip()

# these shouldn't be strictly necessary (should auto-save)
thisExp.saveAsWideText(filename+'.csv', delim='auto')
thisExp.saveAsPickle(filename)
logging.flush()
# make sure everything is closed down
if eyetracker:
    eyetracker.setConnectionState(False)
thisExp.abort()  # or data files will save again on exit
win.close()
core.quit()
