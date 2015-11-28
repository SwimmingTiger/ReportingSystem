using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Param
{
    /// <summary>
    /// 报表数据状态
    /// </summary>
    public class ReportStatus
    {
        /// <summary>
        /// 正常
        /// </summary>
        public const int NORMAL = 0;

        /// <summary>
        /// 未稽核
        /// </summary>
        public const int UNCHECKED = 1;

        /// <summary>
        /// 有错误
        /// </summary>
        public const int MISTAKE = 2;
    }
}