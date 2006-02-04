<!--
    Copyright (C) 2005 Orbeon, Inc.

    This program is free software; you can redistribute it and/or modify it under the terms of the
    GNU Lesser General Public License as published by the Free Software Foundation; either version
    2.1 of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
    without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU Lesser General Public License for more details.

    The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<p:config xmlns:p="http://www.orbeon.com/oxf/pipeline"
          xmlns:oxf="http://www.orbeon.com/oxf/processors"
          xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <p:param type="input" name="data"/>
    <p:param type="input" name="instance"/>
    <p:param type="output" name="data"/>

    <!-- Extract request information -->
    <p:processor name="oxf:request">
        <p:input name="config">
            <config>
                <include>/request/scheme</include>
                <include>/request/server-name</include>
                <include>/request/server-port</include>
                <include>/request/context-path</include>
            </config>
        </p:input>
        <p:output name="data" id="request"/>
    </p:processor>

    <p:choose href="#instance">
        <p:when test="/*/format = 'rss20'">
            <!-- Generate RSS 2.0 feed -->
            <p:processor name="oxf:xslt">
                <p:input name="config" href="recent-posts-rss20.xsl"/>
                <p:input name="data" href="#data"/>
                <p:input name="request" href="#request"/>
                <p:output name="data" ref="data"/>
            </p:processor>
        </p:when>
        <p:otherwise>
            <!-- No format specified, call HTML theme stylesheet -->
            <p:processor name="oxf:xslt">
                <p:input name="config" href="../theme/recent-posts.xsl"/>
                <p:input name="data" href="#data"/>
                <p:input name="instance" href="#instance"/>
                <p:output name="data" ref="data"/>
            </p:processor>
        </p:otherwise>
    </p:choose>

</p:config>