using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Param
{
    /// <summary>
    /// 报表数据状态
    /// </summary>
    public enum ReportStatus
    {
        /// <summary>
        /// 正常
        /// </summary>
        NORMAL = 0,

        /// <summary>
        /// 未稽核
        /// </summary>
        UNCHECKED = 1,

        /// <summary>
        /// 有错误
        /// </summary>
        MISTAKE = 2,
    }
}