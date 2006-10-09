/**
 *  Copyright (C) 2006 Orbeon, Inc.
 *
 *  This program is free software; you can redistribute it and/or modify it under the terms of the
 *  GNU Lesser General Public License as published by the Free Software Foundation; either version
 *  2.1 of the License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 *  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *  See the GNU Lesser General Public License for more details.
 *
 *  The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
 */
package org.orbeon.oxf.xforms.event;

/**
 * Base class for all exception events.
 */
public abstract class XFormsExceptionEvent extends XFormsEvent {

    private Throwable throwable;

    protected XFormsExceptionEvent(String eventName, XFormsEventTarget targetObject, Throwable throwable, boolean bubbles, boolean cancelable) {
        super(eventName, targetObject, bubbles, cancelable);
        this.throwable = throwable;
    }

    public Throwable getThrowable() {
        return throwable;
    }
}
